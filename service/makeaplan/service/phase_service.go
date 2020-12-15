package service

import (
	"context"
	"fmt"

	"github.com/guregu/null"
	"google.golang.org/grpc"

	pb "makeaplan.com/api/model"
	"makeaplan.com/api/service"
	"makeaplan.com/app"
	"makeaplan.com/dao"
	"makeaplan.com/model"
)

type phaseService struct {
}

func RegisterPhaseService(server *grpc.Server) {
	service.RegisterPhaseQueryService(server, service.NewPhaseQueryService(&phaseService{}))
	service.RegisterPhaseModifyService(server, service.NewPhaseModifyService(&phaseService{}))
}

func (p *phaseService) QueryPhaseSummary(ctx context.Context, r *service.QueryPhaseSummaryRequest) (*service.QueryPhaseSummaryResponse, error) {
	phase, err := dao.GetPhase(ctx, uint32(r.GetPhaseId()))
	if err != nil {
		return nil, err
	}

	ts, err := app.TaskStatis(uint32(r.GetPlanId()), &phase.ID)
	if err != nil {
		return nil, err
	}
	ps := &pb.PhaseSummary{
		Phase:      phase.AsPbPhase(),
		Status:     app.TimeBasedStatus(phase.StartTime, phase.EndTime),
		TaskStatis: ts,
	}

	return &service.QueryPhaseSummaryResponse{Phase: ps}, nil
}

func (p *phaseService) QueryPlanPhaseSummary(ctx context.Context, r *service.QueryPlanPhaseSummaryRequest) (*service.QueryPlanPhaseSummaryResponse, error) {
	ps, err := dao.GetPhaseByPlanID(r.GetPlanId())
	if err != nil {
		return nil, err
	}

	pss := make([]*pb.PhaseSummary, 0, len(ps))
	for _, p := range ps {
		ts, err := app.TaskStatis(uint32(r.GetPlanId()), &p.ID)
		if err != nil {
			return nil, err
		}
		pss = append(pss, &pb.PhaseSummary{
			Phase:      p.AsPbPhase(),
			Status:     app.TimeBasedStatus(p.StartTime, p.EndTime),
			TaskStatis: ts,
		})
	}

	return &service.QueryPlanPhaseSummaryResponse{Phases: pss}, nil
}

func (p *phaseService) UpdatePhase(ctx context.Context, r *service.UpdatePhaseRequest) (*service.UpdatePhaseResponse, error) {
	mp := &model.Phase{}
	mp.Title = r.GetTitle()
	if !app.IsBlankString(r.GetNote()) {
		mp.Note = null.StringFrom(r.GetNote().GetValue())
	}
	mp.EndTime = null.TimeFrom(r.GetEndTime().AsTime())
	if r.GetStartTime() != nil {
		mp.StartTime = null.TimeFrom(r.GetStartTime().AsTime())
	}
	err := dao.UpdatePhaseData(ctx, uint32(r.GetPhaseId()), mp)
	if err != nil {
		return nil, err
	}

	return &service.UpdatePhaseResponse{}, nil
}

func (p *phaseService) CreatePhase(ctx context.Context, r *service.CreatePhaseRequest) (*service.CreatePhaseResponse, error) {
	mp := &model.Phase{}
	mp.Title = r.GetTitle()
	if !app.IsBlankString(r.GetNote()) {
		mp.Note = null.StringFrom(r.GetNote().GetValue())
	}
	mp.EndTime = null.TimeFrom(r.GetEndTime().AsTime())
	if r.GetStartTime() != nil {
		mp.StartTime = null.TimeFrom(r.GetStartTime().AsTime())
	}

	newPhaseID, err := dao.AddPhaseInTransaction(ctx, mp, r.GetPlanId())
	if err != nil {
		return nil, fmt.Errorf("failed to dao.AddPhaseInTransaction, err: %v", err)
	}

	return &service.CreatePhaseResponse{PhaseId: int32(newPhaseID)}, nil
}

func (p *phaseService) DeletePhase(ctx context.Context, r *service.DeletePhaseRequest) (*service.DeletePhaseResponse, error) {
	mp := &model.Phase{}
	mp.PhaseStatus = model.PhaseStatusDeleted
	_, _, err := dao.UpdatePhase(ctx, uint32(r.GetPhaseId()), mp)
	if err != nil {
		return nil, fmt.Errorf("failed to dao.UpdatePhase, err: %v", err)
	}

	return &service.DeletePhaseResponse{}, nil
}
