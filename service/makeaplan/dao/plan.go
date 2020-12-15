package dao

import (
	"context"
	"fmt"
	"reflect"
	"time"

	"github.com/guregu/null"

	"makeaplan.com/model"
)

func GetPlan(ctx context.Context, argId int32) (record *model.Plan, err error) {
	record = &model.Plan{}
	if err = DB.First(record, argId).Error; err != nil {
		err = ErrNotFound
		return record, err
	}

	return record, nil
}

func AddPlan(ctx context.Context, record *model.Plan) (result *model.Plan, RowsAffected int64, err error) {
	db := DB.Save(record)
	if err = db.Error; err != nil {
		return nil, -1, ErrInsertFailed
	}

	return record, db.RowsAffected, nil
}

func UpdatePlan(ctx context.Context, argId uint32, updated *model.Plan) (result *model.Plan, RowsAffected int64, err error) {

	result = &model.Plan{}
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

func UpdatePlanData(ctx context.Context, argId uint32, updated *model.Plan) error {
	result := &model.Plan{}
	db := DB.First(result, argId)
	if err := db.Error; err != nil {
		return ErrNotFound
	}

	result.UpdateTime = time.Now()
	result.Title = updated.Title
	result.Note = updated.Note
	result.StartTime = updated.StartTime
	result.EndTime = updated.EndTime

	if !reflect.DeepEqual(result.TotalIndex, updated.TotalIndex) {
		result.CompletedIndex = null.IntFrom(0)
	}
	result.TotalIndex = updated.TotalIndex
	result.MinIndex = updated.MinIndex

	db = db.Save(result)
	if err := db.Error; err != nil {
		return ErrUpdateFailed
	}

	return nil
}

func GetNextCodeForNewPlan(userId uint32) (string, error) {
	var results []*model.Plan
	db := DB.Where("user_id= ? AND plan_status NOT IN (1, 2)", userId).Find(&results)
	if db.Error != nil {
		return "", db.Error
	}

	allAvailableCodeMap := map[int]bool{}
	for i := 0; i < 26; i++ {
		allAvailableCodeMap[i] = true
	}

	minCodeAscii := int('A')
	for _, p := range results {
		rs := []rune(p.Code)
		key := int(rs[0]) - minCodeAscii
		allAvailableCodeMap[key] = false
	}

	var nextCodeAscii = 26
	for c, av := range allAvailableCodeMap {
		if av && c < nextCodeAscii {
			nextCodeAscii = c
		}
	}

	return fmt.Sprintf("%c", nextCodeAscii+minCodeAscii), nil
}

func GetArchivedPlan(userId uint32) ([]*model.Plan, error) {
	var results []*model.Plan
	db := DB.Where("user_id= ? AND plan_status = 2", userId).
		Order("update_time DESC").
		Find(&results)
	return results, db.Error
}

func GetActivePlan(userId uint32) ([]*model.Plan, error) {
	ids, err := GetActivePlanIDs(userId)
	if err != nil {
		return nil, err
	}

	var results []*model.Plan
	if len(ids) == 0 {
		return results, nil
	}

	db := DB.Order("code ASC").Find(&results, ids)

	return results, db.Error
}

func GetActivePlanIDs(userId uint32) ([]int32, error) {
	var results []*model.Plan
	db := DB.Select("id").
		Where("user_id= ? AND plan_status NOT IN (1, 2)", userId).
		Order("code ASC").
		Find(&results)

	ids := make([]int32, 0, len(results))
	for _, r := range results {
		ids = append(ids, int32(r.ID))
	}
	return ids, db.Error
}

func GetPlanTask(planId uint32, phaseId *uint32) ([]*model.Task, error) {
	var args []interface{}
	str := "plan_id = ?"
	args = append(args, planId)
	if phaseId != nil {
		str += " AND phase_id = ?"
		args = append(args, *phaseId)
	}

	db := DB.Select("task_id").Where(str, args...)
	var results []*model.PlanTaskRel
	db = db.Find(&results)
	if db.Error != nil {
		return nil, db.Error
	}

	var taskResults []*model.Task
	if len(results) == 0 {
		return taskResults, nil
	}

	ids := make([]int32, 0, len(results))
	for _, r := range results {
		ids = append(ids, int32(r.TaskID))
	}
	db = DB.Where("task_status != 1").
		Order("insert_time ASC").
		Find(&taskResults, ids)

	return taskResults, db.Error
}

func GetPlanPhase(planId uint32) ([]*model.Phase, error) {
	var results []*model.PlanPhaseRel
	db := DB.Select("phase_id").Where("plan_id = ?", planId).Find(&results)
	if db.Error != nil {
		return nil, db.Error
	}

	var phaseResults []*model.Phase
	if len(results) == 0 {
		return phaseResults, nil
	}

	ids := make([]int32, 0, len(results))
	for _, r := range results {
		ids = append(ids, int32(r.PhaseID))
	}
	db = DB.Where("phase_status != 1").Find(&phaseResults, ids)
	return phaseResults, db.Error
}
