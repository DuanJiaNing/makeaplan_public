package service

import (
	"context"
	"fmt"

	"github.com/guregu/null"
	"google.golang.org/grpc"

	pb "makeaplan.com/api/model"
	"makeaplan.com/api/service"
	"makeaplan.com/dao"
	"makeaplan.com/model"
)

type taskService struct {
}

func RegisterTaskService(server *grpc.Server) {
	service.RegisterTaskQueryService(server, service.NewTaskQueryService(&taskService{}))
	service.RegisterTaskModifyService(server, service.NewTaskModifyService(&taskService{}))
}

func (t *taskService) QueryTask(ctx context.Context, r *service.QueryTaskRequest) (*service.QueryTaskResponse, error) {
	task, err := dao.GetTask(ctx, uint32(r.GetTaskId()))
	if err != nil {
		return nil, err
	}

	return &service.QueryTaskResponse{Task: task.AsPbTask()}, nil
}

func (t *taskService) QueryPlanTask(ctx context.Context, r *service.QueryPlanTaskRequest) (*service.QueryPlanTaskResponse, error) {
	var pid *uint32
	if r.GetPhaseId() != nil {
		v := uint32(r.GetPhaseId().GetValue())
		pid = &v
	}
	ts, err := dao.GetPlanTask(uint32(r.GetPlanId()), pid)
	if err != nil {
		return nil, err
	}

	res := &service.QueryPlanTaskResponse{}
	if len(ts) == 0 {
		return res, nil
	}
	res.Tasks = make([]*pb.Task, 0, len(ts))
	for _, t := range ts {
		res.Tasks = append(res.Tasks, t.AsPbTask())
	}

	return res, nil
}

func (t *taskService) UpdateTask(ctx context.Context, r *service.UpdateTaskRequest) (*service.UpdateTaskResponse, error) {
	mt := &model.Task{}
	mt.Title = r.GetTitle()
	if r.GetStartTime() != nil {
		mt.StartTime = null.TimeFrom(r.GetStartTime().AsTime())
	}
	if r.GetEndTime() != nil {
		mt.EndTime = null.TimeFrom(r.GetEndTime().AsTime())
	}
	err := dao.UpdateTaskData(ctx, uint32(r.GetTaskId()), mt)
	if err != nil {
		return nil, err
	}

	return &service.UpdateTaskResponse{}, nil
}

func (t *taskService) CreateTask(ctx context.Context, r *service.CreateTaskRequest) (*service.CreateTaskResponse, error) {
	mt := &model.Task{}
	mt.Title = r.GetTitle()
	if r.GetStartTime() != nil {
		mt.StartTime = null.TimeFrom(r.GetStartTime().AsTime())
	}
	if r.GetEndTime() != nil {
		mt.EndTime = null.TimeFrom(r.GetEndTime().AsTime())
	}
	id, err := dao.AddTaskInTransaction(ctx, mt, r.GetPlanId(), r.GetPhaseId())
	if err != nil {
		return nil, fmt.Errorf("failed to dao.AddTaskInTransaction, err: %v", err)
	}

	return &service.CreateTaskResponse{TaskId: int32(id)}, nil
}

func (t *taskService) DeleteTask(ctx context.Context, r *service.DeleteTaskRequest) (*service.DeleteTaskResponse, error) {
	mp := &model.Task{}
	mp.TaskStatus = model.TaskStatusDeleted
	_, _, err := dao.UpdateTask(ctx, uint32(r.GetTaskId()), mp)
	if err != nil {
		return nil, fmt.Errorf("failed to dao.UpdateTask, err: %v", err)
	}

	return &service.DeleteTaskResponse{}, nil
}

func (t *taskService) UpdateTaskCheckState(ctx context.Context, r *service.UpdateTaskCheckStateRequest) (*service.UpdateTaskCheckStateResponse, error) {
	mp := &model.Task{}
	if r.GetChecked() {
		mp.Checked = model.TaskChecked
	} else {
		mp.Checked = model.TaskUnChecked
	}
	_, _, err := dao.UpdateTask(ctx, uint32(r.GetTaskId()), mp)
	if err != nil {
		return nil, fmt.Errorf("failed to dao.UpdateTask, err: %v", err)
	}

	return &service.UpdateTaskCheckStateResponse{}, nil
}
