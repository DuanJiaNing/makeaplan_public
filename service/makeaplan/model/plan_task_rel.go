package model

import (
	"time"

	"github.com/guregu/null"
)

// PlanTaskRel struct is a row record of the plan_task_rel table in the makeaplan database
type PlanTaskRel struct {
	ID         uint32    `gorm:"primary_key;AUTO_INCREMENT;column:id;type:uint;"`
	InsertTime time.Time `gorm:"column:insert_time;type:timestamp;default:CURRENT_TIMESTAMP;"`
	UpdateTime time.Time `gorm:"column:update_time;type:timestamp;default:CURRENT_TIMESTAMP;"`
	PlanID     uint32    `gorm:"column:plan_id;type:uint;"`  // 计划id
	TaskID     uint32    `gorm:"column:task_id;type:uint;"`  // 任务id
	PhaseID    null.Int  `gorm:"column:phase_id;type:uint;"` // 阶段id

}

// BeforeSave invoked before saving, return an error if field is not populated.
func (p *PlanTaskRel) BeforeSave() error {
	return nil
}

// Prepare invoked before saving, can be used to populate fields etc.
func (p *PlanTaskRel) Prepare() {
}

// Validate invoked before performing action, return an error if field is not populated.
func (p *PlanTaskRel) Validate(action Action) error {
	return nil
}

func (p *PlanTaskRel) TableName() string {
	return "plan_task_rel"
}
