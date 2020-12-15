package dao

import (
	"context"

	"makeaplan.com/model"
)

func GetAllBlog(ctx context.Context) ([]*model.Blog, error) {
	var results []*model.Blog
	db := DB.Select("*").
		Order("update_time DESC").
		Find(&results)
	return results, db.Error
}

func GetBlog(ctx context.Context, id int32) (*model.Blog, error) {
	record := &model.Blog{}
	if err := DB.First(record, id).Error; err != nil {
		return nil, err
	}

	return record, nil
}
