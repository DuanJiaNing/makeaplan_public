package service

import (
	"reflect"
	"testing"

	"github.com/golang/protobuf/ptypes"
	"github.com/golang/protobuf/ptypes/wrappers"

	pb "makeaplan.com/api/model"
	"makeaplan.com/api/service"
	"makeaplan.com/dao"
)

func Test_planService_CreatePlan(t *testing.T) {
	err := dao.Init()
	if err != nil {
		t.Fatal(err)
	}
	defer dao.Close()

	type args struct {
		r *service.CreatePlanRequest
	}

	tests := []struct {
		name    string
		args    args
		want    *service.CreatePlanResponse
		wantErr bool
	}{
		{
			name: "success",
			args: args{
				r: &service.CreatePlanRequest{
					Title:      "test title",
					Note:       nil,
					Type:       pb.PlanType_PHASED,
					TotalIndex: &wrappers.Int32Value{Value: 120},
					MinIndex:   &wrappers.Int32Value{Value: 10},
					StartTime:  ptypes.TimestampNow(),
					EndTime:    nil,
				},
			},
			want: &service.CreatePlanResponse{
				Id:   21,
				Code: "A",
			},
			wantErr: false,
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			p := &planService{}
			got, err := p.CreatePlan(nil, tt.args.r)
			if (err != nil) != tt.wantErr {
				t.Errorf("CreatePlan() error = %v, wantErr %v", err, tt.wantErr)
				return
			}
			if !reflect.DeepEqual(got, tt.want) {
				t.Errorf("CreatePlan() got = %v, want %v", got, tt.want)
			}
		})
	}
}

func Test_planService_QueryActivePlanIndex(t *testing.T) {
	err := dao.Init()
	if err != nil {
		t.Fatal(err)
	}
	defer dao.Close()

	p := &planService{}
	got, err := p.QueryActivePlanIndex(nil, nil)
	if err != nil {
		t.Fatal(err)
	}
	t.Log(got)
}

func Test_planService_QueryPlanSummary(t *testing.T) {
	err := dao.Init()
	if err != nil {
		t.Fatal(err)
	}
	defer dao.Close()

	p := &planService{}
	got, err := p.QueryPlanSummary(nil, &service.QueryPlanSummaryRequest{
		Id: 22,
	})
	if err != nil {
		t.Fatal(err)
	}
	t.Log(got)
}
