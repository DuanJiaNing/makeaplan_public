package model

import (
	"time"

	"github.com/guregu/null"
	"google.golang.org/protobuf/types/known/timestamppb"

	pb "makeaplan.com/api/model"
)

const PhaseStatusDeleted = 1

// Phase struct is a row record of the phase table in the makeaplan database
type Phase struct {
	ID          uint32      `gorm:"primary_key;AUTO_INCREMENT;column:id;type:uint;"`
	InsertTime  time.Time   `gorm:"column:insert_time;type:timestamp;default:CURRENT_TIMESTAMP;"`
	UpdateTime  time.Time   `gorm:"column:update_time;type:timestamp;default:CURRENT_TIMESTAMP;"`
	Title       string      `gorm:"column:title;type:varchar;size:1000;"` // 标题
	Note        null.String `gorm:"column:note;type:text;size:65535;"`    // 备注
	PhaseStatus int32       `gorm:"column:phase_status;type:tinyint;"`    // 阶段状态，1 删除
	StartTime   null.Time   `gorm:"column:start_time;type:timestamp;"`    // 开始时间
	EndTime     null.Time   `gorm:"column:end_time;type:timestamp;"`      // 结束时间

}

// BeforeSave invoked before saving, return an error if field is not populated.
func (p *Phase) BeforeSave() error {
	return nil
}

// Prepare invoked before saving, can be used to populate fields etc.
func (p *Phase) Prepare() {
}

// Validate invoked before performing action, return an error if field is not populated.
func (p *Phase) Validate(action Action) error {
	return nil
}

func (p *Phase) TableName() string {
	return "phase"
}

func (p *Phase) AsPbPhase() *pb.Phase {
	phase := &pb.Phase{}
	phase.Id = int32(p.ID)
	phase.Title = p.Title
	if p.Note.Valid {
		phase.Note = p.Note.String
	}
	if p.StartTime.Valid {
		phase.StartTime = timestamppb.New(p.StartTime.Time)
	}
	phase.EndTime = timestamppb.New(p.EndTime.Time)
	return phase
}
