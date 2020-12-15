package dao

import (
	"log"
	"time"

	_ "github.com/go-sql-driver/mysql"
	"github.com/jinzhu/gorm"
)

var DB *gorm.DB

const url = "root:xxx@tcp(xxx:3306)/makeaplan?parseTime=true"

func Init() error {
	db, err := gorm.Open("mysql", url)
	if err != nil {
		return err
	}

	DB = db
	//DB.LogMode(true)

	sqlDB := db.DB()
	sqlDB.SetMaxIdleConns(5)
	sqlDB.SetMaxOpenConns(10)
	sqlDB.SetConnMaxLifetime(time.Hour * 12)

	return nil
}

func Close() {
	if DB != nil {
		err := DB.Close()
		if err != nil {
			log.Printf("failed to close gorm DB, err: %v", err)
		}
	}
}
