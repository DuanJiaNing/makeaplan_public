package model

import (
	"time"

	"github.com/guregu/null"
	"google.golang.org/protobuf/types/known/timestamppb"

	pb "makeaplan.com/api/model"
)

const TaskChecked = 1
const TaskUnChecked = 2
const TaskStatusDeleted = 1

// Task struct is a row record of the task table in the makeaplan database
type Task struct {
	ID         uint32    `gorm:"primary_key;AUTO_INCREMENT;column:id;type:uint;"`
	InsertTime time.Time `gorm:"column:insert_time;type:timestamp;default:CURRENT_TIMESTAMP;"`
	UpdateTime time.Time `gorm:"column:update_time;type:timestamp;default:CURRENT_TIMESTAMP;"`
	Title      string    `gorm:"column:title;type:varchar;size:1000;"` // 标题
	Checked    int32     `gorm:"column:checked;type:tinyint;"`         // 状态，1 完成
	TaskStatus int32     `gorm:"column:task_status;type:tinyint;"`     // 任务状态，1 删除
	StartTime  null.Time `gorm:"column:start_time;type:timestamp;"`    // 开始时间
	EndTime    null.Time `gorm:"column:end_time;type:timestamp;"`      // 结束时间

}

// BeforeSave invoked before saving, return an error if field is not populated.
func (t *Task) BeforeSave() error {
	return nil
}

// Prepare invoked before saving, can be used to populate fields etc.
func (t *Task) Prepare() {
}

// Validate invoked before performing action, return an error if field is not populated.
func (t *Task) Validate(action Action) error {
	return nil
}

func (t *Task) TableName() string {
	return "task"
}

func (t *Task) AsPbTask() *pb.Task {
	p := &pb.Task{}
	p.Id = int32(t.ID)
	p.Title = t.Title
	p.Checked = t.Checked == TaskStatusDeleted
	if t.StartTime.Valid {
		p.StartTime = timestamppb.New(t.StartTime.Time)
	}
	if t.EndTime.Valid {
		p.EndTime = timestamppb.New(t.EndTime.Time)
	}
	return p
}
