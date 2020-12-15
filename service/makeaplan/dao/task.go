package dao

import (
	"context"
	"time"

	"github.com/golang/protobuf/ptypes/wrappers"
	"github.com/guregu/null"
	"github.com/jinzhu/gorm"

	"makeaplan.com/model"
)

func GetTask(ctx context.Context, argId uint32) (record *model.Task, err error) {
	record = &model.Task{}
	if err = DB.First(record, argId).Error; err != nil {
		err = ErrNotFound
		return record, err
	}

	return record, nil
}

func UpdateTask(ctx context.Context, argId uint32, updated *model.Task) (result *model.Task, RowsAffected int64, err error) {

	result = &model.Task{}
	db := DB.First(result, argId)
	if err = db.Error; err != nil {
		return nil, -1, ErrNotFound
	}

	if err = copy(result, updated); err != nil {
		return nil, -1, ErrUpdateFailed
	}
	result.UpdateTime = time.Now()

	db = db.Save(result)
	if err = db.Error; err != nil {
		return nil, -1, ErrUpdateFailed
	}

	return result, db.RowsAffected, nil
}

func UpdateTaskData(ctx context.Context, argId uint32, updated *model.Task) error {
	result := &model.Task{}
	db := DB.First(result, argId)
	if err := db.Error; err != nil {
		return ErrNotFound
	}

	result.UpdateTime = time.Now()
	result.Title = updated.Title
	result.StartTime = updated.StartTime
	result.EndTime = updated.EndTime

	db = db.Save(result)
	if err := db.Error; err != nil {
		return ErrUpdateFailed
	}

	return nil
}

func AddTaskInTransaction(ctx context.Context, task *model.Task, planId int32, phaseId *wrappers.Int32Value) (uint32, error) {
	err := DB.Transaction(func(tx *gorm.DB) error {
		db := tx.Save(task)
		if db.Error != nil {
			return db.Error
		}

		ptr := &model.PlanTaskRel{}
		ptr.TaskID = task.ID
		ptr.PlanID = uint32(planId)
		if phaseId != nil {
			ptr.PhaseID = null.IntFrom(int64(phaseId.Value))
		}
		db = tx.Save(ptr)
		if db.Error != nil {
			return db.Error
		}

		return nil
	})
	if err != nil {
		return 0, err
	}

	return task.ID, nil
}
