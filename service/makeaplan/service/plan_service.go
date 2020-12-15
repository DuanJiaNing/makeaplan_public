package service

import (
	"context"
	"fmt"

	"github.com/golang/protobuf/ptypes/wrappers"
	"github.com/guregu/null"
	"google.golang.org/grpc"

	pb "makeaplan.com/api/model"
	"makeaplan.com/api/service"
	"makeaplan.com/app"
	"makeaplan.com/dao"
	"makeaplan.com/model"
)

// Assume all fields are valid, verification only in client side.

type planService struct {
}

func RegisterPlanService(server *grpc.Server) {
	p := &planService{}
	service.RegisterPlanQueryService(server, service.NewPlanQueryService(p))
	service.RegisterPlanModifyService(server, service.NewPlanModifyService(p))
}

func (p *planService) DeletePlan(ctx context.Context, r *service.DeletePlanRequest) (*service.DeletePlanResponse, error) {
	up := &model.Plan{}
	up.PlanStatus = model.PlanStatusDeleted
	_, _, err := dao.UpdatePlan(ctx, uint32(r.GetId()), up)
	if err != nil {
		return nil, fmt.Errorf("failed to dao.UpdatePlan, err: %v", err)
	}

	return &service.DeletePlanResponse{}, nil
}

func (p *planService) UpdatePlanCompletedIndex(ctx context.Context, r *service.UpdatePlanCompletedIndexRequest) (*service.UpdatePlanCompletedIndexResponse, error) {
	up := &model.Plan{}
	up.CompletedIndex = null.IntFrom(int64(r.GetValue()))
	_, _, err := dao.UpdatePlan(ctx, uint32(r.GetPlanId()), up)
	if err != nil {
		return nil, err
	}

	return &service.UpdatePlanCompletedIndexResponse{}, nil
}

func (p *planService) UpdatePlanArchiveState(ctx context.Context, r *service.UpdatePlanArchiveStateRequest) (*service.UpdatePlanArchiveStateResponse, error) {
	uid := app.UIDFromContext(ctx)

	up := &model.Plan{}
	if r.GetArchived() {
		up.PlanStatus = model.PlanStatusArchived
	} else {
		up.PlanStatus = -1

		code, err := dao.GetNextCodeForNewPlan(uid)
		if err != nil {
			return nil, err
		}
		up.Code = code
	}
	_, _, err := dao.UpdatePlan(ctx, uint32(r.GetPlanId()), up)
	if err != nil {
		return nil, err
	}

	var newCode *wrappers.StringValue
	if !r.GetArchived() {
		newCode = &wrappers.StringValue{
			Value: up.Code,
		}
	}
	return &service.UpdatePlanArchiveStateResponse{
		PlanNewCode: newCode,
	}, nil
}

func (p *planService) UpdatePlan(ctx context.Context, r *service.UpdatePlanRequest) (*service.UpdatePlanResponse, error) {
	mp := &model.Plan{}
	mp.Title = r.GetTitle()
	if !app.IsBlankString(r.GetNote()) {
		mp.Note = null.StringFrom(r.GetNote().GetValue())
	}
	if r.GetTotalIndex() != nil {
		mp.TotalIndex = null.IntFrom(int64(r.GetTotalIndex().GetValue()))
	}
	if r.GetMinIndex() != nil {
		mp.MinIndex = null.IntFrom(int64(r.GetMinIndex().GetValue()))
	}
	mp.StartTime = null.TimeFrom(r.GetStartTime().AsTime())
	if r.GetEndTime() != nil {
		mp.EndTime = null.TimeFrom(r.GetEndTime().AsTime())
	}
	err := dao.UpdatePlanData(ctx, uint32(r.GetPlanId()), mp)
	if err != nil {
		return nil, err
	}

	return &service.UpdatePlanResponse{}, nil
}

func (p *planService) CreatePlan(ctx context.Context, r *service.CreatePlanRequest) (*service.CreatePlanResponse, error) {
	uid := app.UIDFromContext(ctx)

	mp := &model.Plan{}
	mp.UserID = uid
	mp.Title = r.GetTitle()
	mp.Type = int32(r.GetType())
	if !app.IsBlankString(r.GetNote()) {
		mp.Note = null.StringFrom(r.GetNote().GetValue())
	}
	if r.GetTotalIndex() != nil {
		mp.TotalIndex = null.IntFrom(int64(r.GetTotalIndex().GetValue()))
	}
	if r.GetMinIndex() != nil {
		mp.MinIndex = null.IntFrom(int64(r.GetMinIndex().GetValue()))
	}
	mp.StartTime = null.TimeFrom(r.GetStartTime().AsTime())
	if r.GetEndTime() != nil {
		mp.EndTime = null.TimeFrom(r.GetEndTime().AsTime())
	}

	code, err := dao.GetNextCodeForNewPlan(uid)
	if err != nil {
		return nil, err
	}
	mp.Code = code

	np, _, err := dao.AddPlan(ctx, mp)
	if err != nil {
		return nil, fmt.Errorf("failed to dao.AddPlan, err: %v", err)
	}
	return &service.CreatePlanResponse{
		Id:   int32(np.ID),
		Code: np.Code,
	}, nil
}

func (p *planService) QueryPlanCount(ctx context.Context, _ *service.QueryPlanCountRequest) (*service.QueryPlanCountResponse, error) {
	uid := app.UIDFromContext(ctx)

	plans, err := dao.GetArchivedPlan(uid)
	if err != nil {
		return nil, err
	}
	ids, err := dao.GetActivePlanIDs(uid)
	if err != nil {
		return nil, err
	}

	return &service.QueryPlanCountResponse{
		ActivePlanCount:   int32(len(ids)),
		ArchivedPlanCount: int32(len(plans)),
	}, nil
}

func (p *planService) QueryArchivedPlan(ctx context.Context, _ *service.QueryArchivedPlanRequest) (*service.QueryArchivedPlanResponse, error) {
	uid := app.UIDFromContext(ctx)

	plans, err := dao.GetArchivedPlan(uid)
	if err != nil {
		return nil, err
	}

	res := &service.QueryArchivedPlanResponse{}
	if len(plans) == 0 {
		return res, nil
	}

	ps := make([]*pb.Plan, 0, len(plans))
	for _, p := range plans {
		ps = append(ps, p.AsPBPlan())
	}
	res.Plans = ps
	return res, nil
}

func (p *planService) QueryActivePlanSummary(ctx context.Context, _ *service.QueryActivePlanSummaryRequest) (*service.QueryActivePlanSummaryResponse, error) {
	uid := app.UIDFromContext(ctx)

	plans, err := dao.GetActivePlan(uid)
	if err != nil {
		return nil, err
	}

	res := &service.QueryActivePlanSummaryResponse{}
	if len(plans) == 0 {
		return res, nil
	}

	res.Plans = make([]*pb.PlanSummary, 0, len(plans))
	for _, pl := range plans {
		ps, err := p.queryPlanSummary(pl)
		if err != nil {
			return nil, err
		}

		res.Plans = append(res.Plans, ps)
	}
	return res, nil
}

func (p *planService) queryPlanSummary(plan *model.Plan) (*pb.PlanSummary, error) {
	ps := &pb.PlanSummary{}
	ps.Plan = plan.AsPBPlan()
	ps.Status = app.TimeBasedStatus(plan.StartTime, plan.EndTime)

	if plan.Type == model.PlanTypeTaskList {
		ts, err := app.TaskStatis(plan.ID, nil)
		if err != nil {
			return nil, err
		}
		ps.TaskStatis = ts
		return ps, nil
	}

	phases, err := dao.GetPlanPhase(plan.ID)
	if err != nil {
		return nil, err
	}

	ps.PhaseStatis = &pb.Statistics{
		Total: int32(len(phases)),
	}
	ps.TaskStatis = &pb.Statistics{}
	for _, phase := range phases {
		if app.TimeBasedStatus(phase.StartTime, phase.EndTime) == pb.CommonStatus_FINISHED {
			ps.PhaseStatis.Completed += 1
		}

		ts, err := app.TaskStatis(plan.ID, &phase.ID)
		if err != nil {
			return nil, err
		}
		ps.TaskStatis.Total += ts.Total
		ps.TaskStatis.Completed += ts.Completed
	}

	return ps, nil
}

func (p *planService) QueryActivePlanIndex(ctx context.Context, _ *service.QueryActivePlanIndexRequest) (*service.QueryActivePlanIndexResponse, error) {
	uid := app.UIDFromContext(ctx)

	ids, err := dao.GetActivePlanIDs(uid)
	if err != nil {
		return nil, err
	}
	return &service.QueryActivePlanIndexResponse{
		Ids: ids,
	}, nil
}

func (p *planService) QueryPlanSummary(ctx context.Context, r *service.QueryPlanSummaryRequest) (*service.QueryPlanSummaryResponse, error) {
	plan, err := dao.GetPlan(ctx, r.GetId())
	if err != nil {
		return nil, err
	}
	ps, err := p.queryPlanSummary(plan)
	if err != nil {
		return nil, err
	}

	return &service.QueryPlanSummaryResponse{
		PlanSummary: ps,
	}, nil
}
