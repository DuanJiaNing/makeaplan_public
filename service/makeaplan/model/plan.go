package model

import (
	"time"

	"github.com/guregu/null"
	"google.golang.org/protobuf/types/known/timestamppb"

	pb "makeaplan.com/api/model"
)

const PlanStatusDeleted = 1
const PlanStatusArchived = 2

const PlanTypePhased = 2
const PlanTypeTaskList = 1

// Plan struct is a row record of the plan table in the makeaplan database
type Plan struct {
	ID             uint32      `gorm:"primary_key;AUTO_INCREMENT;column:id;type:uint;"`
	InsertTime     time.Time   `gorm:"column:insert_time;type:timestamp;default:CURRENT_TIMESTAMP;"`
	UpdateTime     time.Time   `gorm:"column:update_time;type:timestamp;default:CURRENT_TIMESTAMP;"`
	UserID         uint32      `gorm:"column:user_id;type:uint;"`            // 用户id
	Title          string      `gorm:"column:title;type:varchar;size:1000;"` // 标题
	Code           string      `gorm:"column:code;type:varchar;size:10;"`    // 计划编号
	Note           null.String `gorm:"column:note;type:text;size:65535;"`    // 备注
	Type           int32       `gorm:"column:type;type:tinyint;"`            // 计划类型，1 任务清单 2 多阶段任务
	PlanStatus     int32       `gorm:"column:plan_status;type:tinyint;"`     // 计划状态，1 删除 2 归档
	TotalIndex     null.Int    `gorm:"column:total_index;type:int;"`         // 目标值
	MinIndex       null.Int    `gorm:"column:min_index;type:int;"`           // 最低目标值
	CompletedIndex null.Int    `gorm:"column:completed_index;type:int;"`     // 已完成目标值
	StartTime      null.Time   `gorm:"column:start_time;type:timestamp;"`    // 开始时间
	EndTime        null.Time   `gorm:"column:end_time;type:timestamp;"`      // 结束时间

}

// BeforeSave invoked before saving, return an error if field is not populated.
func (p *Plan) BeforeSave() error {
	return nil
}

// Prepare invoked before saving, can be used to populate fields etc.
func (p *Plan) Prepare() {
}

// Validate invoked before performing action, return an error if field is not populated.
func (p *Plan) Validate(action Action) error {
	return nil
}

func (p *Plan) TableName() string {
	return "plan"
}

func (p *Plan) AsPBPlan() *pb.Plan {
	plan := &pb.Plan{}
	plan.Id = int32(p.ID)
	plan.Title = p.Title
	plan.Code = p.Code
	plan.Type = pb.PlanType(p.Type)
	if p.Note.Valid {
		plan.Note = p.Note.String
	}
	if p.TotalIndex.Valid {
		plan.TotalIndex = int32(p.TotalIndex.Int64)
	}
	if p.MinIndex.Valid {
		plan.MinIndex = int32(p.MinIndex.Int64)
	}
	if p.CompletedIndex.Valid {
		plan.CompletedIndex = int32(p.CompletedIndex.Int64)
	}
	plan.StartTime = timestamppb.New(p.StartTime.Time)
	if p.EndTime.Valid {
		plan.EndTime = timestamppb.New(p.EndTime.Time)
	}
	plan.UpdateTime = timestamppb.New(p.UpdateTime)
	return plan
}
