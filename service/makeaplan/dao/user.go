package dao

import (
	"context"
	"math/rand"
	"time"

	"makeaplan.com/model"
)

func GetUser(ctx context.Context, argId uint32) (record *model.User, err error) {
	record = &model.User{}
	if err = DB.First(record, argId).Error; err != nil {
		err = ErrNotFound
		return record, err
	}

	return record, nil
}

func FindUser(ctx context.Context, deviceID string) (record *model.User, err error) {
	record = &model.User{}
	if err = DB.Where("device_id = ? AND user_status = 1", deviceID).Find(record).Error; err != nil {
		err = ErrNotFound
		return record, err
	}

	return record, nil
}

func FindUserByDataID(ctx context.Context, dataID string) (record *model.User, err error) {
	record = &model.User{}
	if err = DB.Where("data_id = ?", dataID).Find(record).Error; err != nil {
		err = ErrNotFound
		return record, err
	}

	return record, nil
}

func AddUser(ctx context.Context, record *model.User) (result *model.User, RowsAffected int64, err error) {
	db := DB.Save(record)
	if err = db.Error; err != nil {
		return nil, -1, ErrInsertFailed
	}

	return record, db.RowsAffected, nil
}

func UpdateUser(ctx context.Context, argId uint32, updated *model.User) (result *model.User, RowsAffected int64, err error) {

	result = &model.User{}
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

func GenerateUserDataID(ctx context.Context) (string, error) {
	for {
		g := generateDataID()
		_, err := FindUserByDataID(ctx, g)
		if err == ErrNotFound {
			return g, nil
		}
		if err != nil {
			return "", err
		}
	}
}

var chars = []byte("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")

const length = 6

func generateDataID() string {
	cl := len(chars)
	var cs []byte
	for i := 0; i < length; i++ {
		ix := rand.Intn(cl)
		cs = append(cs, chars[ix])
	}
	return string(cs)
}
