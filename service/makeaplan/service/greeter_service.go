package service

import (
	"context"
	"errors"
	"fmt"

	"github.com/guregu/null"
	"google.golang.org/grpc"

	"makeaplan.com/api/service"
	"makeaplan.com/app"
	"makeaplan.com/dao"
	"makeaplan.com/model"
)

type greeterService struct {
}

func RegisterGreeterService(server *grpc.Server) {
	service.RegisterGreeterService(server, service.NewGreeterService(&greeterService{}))
}

func (g *greeterService) UpdateUsername(ctx context.Context, request *service.UpdateUsernameRequest) (*service.UpdateUsernameReply, error) {
	uid := app.UIDFromContext(ctx)
	mp := &model.User{}
	mp.Username = null.StringFrom(request.GetUsername())
	_, _, err := dao.UpdateUser(ctx, uid, mp)
	if err != nil {
		return nil, err
	}

	return &service.UpdateUsernameReply{}, nil
}

func (g *greeterService) UpdateDeviceID(ctx context.Context, request *service.UpdateDeviceIDRequest) (*service.UpdateDeviceIDReply, error) {
	did := app.DIDFromContext(ctx)
	if reachQuota(ctx, did, request.GetDataId()) {
		app.Printf(ctx, "reached. to_did: %s, usedDataID: %s\n", did, request.GetDataId())
		return nil, errors.New("reach quota")
	}

	user, err := dao.FindUserByDataID(ctx, request.GetDataId())
	if err != nil {
		return nil, err
	}
	oldUser, err := dao.FindUser(ctx, did)
	if err != nil && err != dao.ErrNotFound {
		return nil, err
	}
	if err != dao.ErrNotFound && oldUser != nil {
		if oldUser.DataId == request.GetDataId() {
			return &service.UpdateDeviceIDReply{}, nil
		}

		oldUser.DeviceId = fmt.Sprintf("take by user with id: %d", user.ID)
		_, _, err = dao.UpdateUser(ctx, oldUser.ID, oldUser)
		if err != nil {
			return nil, err
		}
	}

	mp := &model.User{}
	mp.DeviceId = did
	_, _, err = dao.UpdateUser(ctx, user.ID, mp)
	if err != nil {
		return nil, err
	}

	return &service.UpdateDeviceIDReply{}, nil
}

func (g *greeterService) Start(ctx context.Context, request *service.StartRequest) (*service.StartReply, error) {
	did := app.DIDFromContext(ctx)
	dtid, err := dao.GenerateUserDataID(ctx)
	if err != nil {
		return nil, err
	}

	mu := &model.User{
		DeviceId:   did,
		UserStatus: model.UserStatusNormal,
		DataId:     dtid,
	}
	_, _, err = dao.AddUser(ctx, mu)
	if err != nil {
		return nil, fmt.Errorf("failed to dao.AddUser, err: %v", err)
	}

	return &service.StartReply{}, nil
}

func (g *greeterService) SayHello(ctx context.Context, request *service.HelloRequest) (*service.HelloReply, error) {
	uid := app.UIDFromContext(ctx)
	user, err := dao.GetUser(ctx, uid)
	if err != nil {
		return nil, err
	}

	un := "***"
	if user.Username.Valid {
		un = user.Username.String
	}
	return &service.HelloReply{
		Message: fmt.Sprintf("Hello there, %s, %s", un, user.DataId),
	}, nil
}

func (g *greeterService) InitPerSetPlan(ctx context.Context, request *service.InitPerSetPlanRequest) (*service.InitPerSetPlanReply, error) {
	uid := app.UIDFromContext(ctx)
	err := dao.InsertPreSetPlan(request.GetId(), uid)
	if err != nil {
		return nil, err
	}

	return &service.InitPerSetPlanReply{}, nil
}
