package dao

import (
	"errors"
	"time"

	"github.com/guregu/null"
	"github.com/jinzhu/gorm"

	"makeaplan.com/model"
)

const (
	planTypePhased = iota
	planTypeTasks
)

type plan struct {
	p        *model.Plan
	planType int
	phases   []phase
	tasks    []*model.Task
}

type phase struct {
	p     *model.Phase
	tasks []*model.Task
}

func getStartDate(monthAfterNow int, dayAfterNow int) time.Time {
	now := time.Now()
	t := now.AddDate(0, monthAfterNow, dayAfterNow)
	return time.Date(t.Year(), t.Month(), t.Day(), 0, 0, 0, 0, time.Local)
}

func getEndDate(monthAfterNow int, dayAfterNow int) time.Time {
	now := time.Now()
	t := now.AddDate(0, monthAfterNow, dayAfterNow)
	return time.Date(t.Year(), t.Month(), t.Day(), 23, 59, 59, 0, time.Local)
}

func getTime(monthAfterNow int, dayAfterNow int, hour, minute int) time.Time {
	now := time.Now()
	t := now.AddDate(0, monthAfterNow, dayAfterNow)
	return time.Date(t.Year(), t.Month(), t.Day(), hour, minute, 0, 0, time.Local)
}

func InsertPreSetPlan(id int32, userID uint32) error {
	var plans = map[int32]plan{
		1: {
			p: &model.Plan{
				Title:          "这是一个模拟的任务清单计划，长按查看备注。",
				Code:           "A",
				Note:           null.StringFrom("这里显示的是计划的备注信息，你可以将一些无法在计划标题，或任务清单中涵盖的信息记录在这里。"),
				Type:           model.PlanTypeTaskList,
				TotalIndex:     null.IntFrom(100),
				MinIndex:       null.IntFrom(60),
				CompletedIndex: null.IntFrom(18),
				StartTime:      null.TimeFrom(getStartDate(0, 2)),
				EndTime:        null.TimeFrom(getEndDate(0, 2+22)),
			},
			planType: planTypeTasks,
			tasks: []*model.Task{
				{
					Title:     "这是一个模拟的任务。",
					Checked:   model.TaskChecked,
					StartTime: null.TimeFrom(getTime(0, 3, 6, 30)),
					EndTime:   null.TimeFrom(getTime(0, 3, 7, 20)),
				},
				{
					Title:     "完成一个任务，就点击左边(☑️)进行勾选吧。",
					Checked:   model.TaskUnChecked,
					StartTime: null.TimeFrom(getTime(0, 5, 14, 0)),
				},
				{
					Title:   "任务可以只设置开始时间，或者结束时间，或者都不设置。",
					Checked: model.TaskChecked,
				},
				{
					Title:     "长按在弹出的预览窗口中查看完整信息。",
					Checked:   model.TaskUnChecked,
					StartTime: null.TimeFrom(getTime(0, 6, 16, 10)),
					EndTime:   null.TimeFrom(getTime(0, 20, 7, 50)),
				},
			},
		},
		2: {
			p: &model.Plan{
				Title:     "这是一个模拟的分阶段计划。随着时间推移，计划状态会自动更新。",
				Code:      "B",
				Note:      null.StringFrom("计划有如下几种状态：\n★n天后开始 »进行中 »已结束 »已归档★\n计划结束时会出现［归档］选项，在将计划归档之前，你可以随时更新它们。处于［已归档］状态的计划是没法对其进行任何操作的，除了［恢复］。恢复后可以再次在计划列表中看到它。"),
				Type:      model.PlanTypePhased,
				StartTime: null.TimeFrom(getStartDate(0, -5)),
			},
			planType: planTypePhased,
			phases: []phase{
				{
					p: &model.Phase{
						Title:   "这是计划的一个阶段，左边📅图标上显示了阶段的截止日期。",
						Note:    null.StringFrom("这里显示的是阶段的备注信息，利用好备注吧，保留需要的细节。"),
						EndTime: null.TimeFrom(getEndDate(0, 10)),
					},
					tasks: []*model.Task{
						{
							Title:   "为每个阶段创建对应的计划",
							Checked: model.TaskChecked,
						},
						{
							Title:     "任务完成了就✅它们",
							Checked:   model.TaskUnChecked,
							StartTime: null.TimeFrom(getTime(0, 11, 12, 40)),
							EndTime:   null.TimeFrom(getTime(0, 11, 12, 57)),
						},
					},
				},
				{
					p: &model.Phase{
						Title:     "阶段也有相应的状态，这个阶段已经结束了。",
						Note:      null.StringFrom("⚠️  通过编辑时间可以修改阶段的状态，计划也是一样的。"),
						StartTime: null.TimeFrom(getStartDate(0, -3)),
						EndTime:   null.TimeFrom(getEndDate(0, -1)),
					},
				},
				{
					p: &model.Phase{
						Title:     "进行中的阶段。",
						StartTime: null.TimeFrom(getStartDate(0, -2)),
						EndTime:   null.TimeFrom(getEndDate(0, 2)),
					},
				},
			},
		},
	}

	p, ok := plans[id]
	if !ok {
		return errors.New("plan not exist")
	}

	err := DB.Transaction(func(tx *gorm.DB) error {
		p.p.UserID = userID
		db := tx.Save(p.p)
		if db.Error != nil {
			return db.Error
		}
		planID := p.p.ID

		if p.planType == planTypeTasks {
			for _, t := range p.tasks {
				db = tx.Save(t)
				if db.Error != nil {
					return db.Error
				}

				ptr := &model.PlanTaskRel{}
				ptr.TaskID = t.ID
				ptr.PlanID = planID
				db = tx.Save(ptr)
				if db.Error != nil {
					return db.Error
				}
			}
		} else {
			for _, ps := range p.phases {
				db = tx.Save(ps.p)
				if db.Error != nil {
					return db.Error
				}
				phaseID := ps.p.ID

				ptr := &model.PlanPhaseRel{}
				ptr.PhaseID = phaseID
				ptr.PlanID = planID
				db = tx.Save(ptr)
				if db.Error != nil {
					return db.Error
				}

				for _, t := range ps.tasks {
					db = tx.Save(t)
					if db.Error != nil {
						return db.Error
					}

					ptr := &model.PlanTaskRel{}
					ptr.TaskID = t.ID
					ptr.PlanID = planID
					ptr.PhaseID = null.IntFrom(int64(phaseID))
					db = tx.Save(ptr)
					if db.Error != nil {
						return db.Error
					}
				}
			}
		}
		return nil
	})
	return err
}
