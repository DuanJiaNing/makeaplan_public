package model

import (
	"time"
)

// PlanPhaseRel struct is a row record of the plan_phase_rel table in the makeaplan database
type PlanPhaseRel struct {
	ID         uint32    `gorm:"primary_key;AUTO_INCREMENT;column:id;type:uint;"`
	InsertTime time.Time `gorm:"column:insert_time;type:timestamp;default:CURRENT_TIMESTAMP;"`
	UpdateTime time.Time `gorm:"column:update_time;type:timestamp;default:CURRENT_TIMESTAMP;"`
	PlanID     uint32    `gorm:"column:plan_id;type:uint;"`  // 计划id
	PhaseID    uint32    `gorm:"column:phase_id;type:uint;"` // 阶段id

}

// BeforeSave invoked before saving, return an error if field is not populated.
func (p *PlanPhaseRel) BeforeSave() error {
	return nil
}

// Prepare invoked before saving, can be used to populate fields etc.
func (p *PlanPhaseRel) Prepare() {
}

// Validate invoked before performing action, return an error if field is not populated.
func (p *PlanPhaseRel) Validate(action Action) error {
	return nil
}

func (p *PlanPhaseRel) TableName() string {
	return "plan_phase_rel"
}
