package model

import (
	"time"

	"google.golang.org/protobuf/types/known/timestamppb"

	pb "makeaplan.com/api/model"
)

type Blog struct {
	ID         uint32    `gorm:"primary_key;AUTO_INCREMENT;column:id;type:uint;"`
	InsertTime time.Time `gorm:"column:insert_time;type:timestamp;default:CURRENT_TIMESTAMP;"`
	UpdateTime time.Time `gorm:"column:update_time;type:timestamp;default:CURRENT_TIMESTAMP;"`
	Title      string    `gorm:"column:title;type:varchar;size:1000;"` // 标题
	Url        string    `gorm:"column:url;type:varchar;size:1000;"`   // 文章地址
}

func (b *Blog) BeforeSave() error {
	return nil
}

func (b *Blog) Prepare() {
}

func (b *Blog) Validate(action Action) error {
	return nil
}

func (b *Blog) TableName() string {
	return "blog"
}

func (b *Blog) AsPBPlan() *pb.Blog {
	blog := &pb.Blog{}
	blog.Id = int32(b.ID)
	blog.Title = b.Title
	blog.Url = b.Url
	blog.InsertTime = timestamppb.New(b.InsertTime)
	blog.UpdateTime = timestamppb.New(b.UpdateTime)
	return blog
}
