package dao

import (
	"context"
	"time"

	"github.com/jinzhu/gorm"

	"makeaplan.com/model"
)

func GetPhase(ctx context.Context, argId uint32) (record *model.Phase, err error) {
	record = &model.Phase{}
	if err = DB.First(record, argId).Error; err != nil {
		err = ErrNotFound
		return record, err
	}

	return record, nil
}

func UpdatePhase(ctx context.Context, argId uint32, updated *model.Phase) (result *model.Phase, RowsAffected int64, err error) {
	result = &model.Phase{}
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

func UpdatePhaseData(ctx context.Context, argId uint32, updated *model.Phase) error {
	result := &model.Phase{}
	db := DB.First(result, argId)
	if err := db.Error; err != nil {
		return ErrNotFound
	}

	result.UpdateTime = time.Now()
	result.Title = updated.Title
	result.Note = updated.Note
	result.StartTime = updated.StartTime
	result.EndTime = updated.EndTime

	db = db.Save(result)
	if err := db.Error; err != nil {
		return ErrUpdateFailed
	}

	return nil
}

func GetPhaseByPlanID(planId int32) ([]*model.Phase, error) {
	var relResult []*model.PlanPhaseRel
	db := DB.Where("plan_id = ?", planId).Find(&relResult)
	if db.Error != nil {
		return nil, db.Error
	}

	result := make([]*model.Phase, 0, len(relResult))
	if len(relResult) == 0 {
		return result, nil
	}

	ids := make([]int32, 0, len(relResult))
	for _, r := range relResult {
		ids = append(ids, int32(r.PhaseID))
	}
	db = DB.Where("phase_status != 1").Order("insert_time ASC").Find(&result, ids)
	return result, db.Error
}

func AddPhaseInTransaction(ctx context.Context, phase *model.Phase, planId int32) (uint32, error) {
	err := DB.Transaction(func(tx *gorm.DB) error {
		db := tx.Save(phase)
		if db.Error != nil {
			return db.Error
		}

		ppr := &model.PlanPhaseRel{}
		ppr.PhaseID = phase.ID
		ppr.PlanID = uint32(planId)
		db = tx.Save(ppr)
		if db.Error != nil {
			return db.Error
		}

		return nil
	})
	if err != nil {
		return 0, err
	}

	return phase.ID, nil
}
