package model

import (
	"time"

	"github.com/guregu/null"
)

const UserStatusNormal = 1

// User struct is a row record of the user table in the makeaplan database
type User struct {
	ID         uint32      `gorm:"primary_key;AUTO_INCREMENT;column:id;type:uint;"`
	InsertTime time.Time   `gorm:"column:insert_time;type:timestamp;default:CURRENT_TIMESTAMP;"`
	UpdateTime time.Time   `gorm:"column:update_time;type:timestamp;default:CURRENT_TIMESTAMP;"`
	DeviceId   string      `gorm:"column:device_id;type:varchar;size:255;"` // 手机或邮箱
	DataId     string      `gorm:"column:data_id;type:varchar;size:255;"`   // 数据 id
	Username   null.String `gorm:"column:username;type:varchar;size:255;"`  // 用户名
	UserStatus int         `gorm:"column:user_status;type:tinyint;"`        // 账号状态，1 正常 2 不可用

}

// BeforeSave invoked before saving, return an error if field is not populated.
func (u *User) BeforeSave() error {
	return nil
}

// Prepare invoked before saving, can be used to populate fields etc.
func (u *User) Prepare() {
}

// Validate invoked before performing action, return an error if field is not populated.
func (u *User) Validate(action Action) error {
	return nil
}

func (u *User) TableName() string {
	return "user"
}
