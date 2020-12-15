package dao

import (
	"errors"
	"fmt"
	"reflect"
)

var (
	ErrNotFound     = fmt.Errorf("record Not Found")
	ErrUpdateFailed = fmt.Errorf("db update error")
	ErrInsertFailed = fmt.Errorf("db insert error")
)

func copy(dst interface{}, src interface{}) error {
	dstV := reflect.Indirect(reflect.ValueOf(dst))
	srcV := reflect.Indirect(reflect.ValueOf(src))

	if !dstV.CanAddr() {
		return errors.New("copy to value is unaddressable")
	}

	if srcV.Type() != dstV.Type() {
		return errors.New("different types can be copied")
	}

	for i := 0; i < dstV.NumField(); i++ {
		f := srcV.Field(i)
		if !isZeroOfUnderlyingType(f.Interface()) {
			dstV.Field(i).Set(f)
		}
	}

	return nil
}

func isZeroOfUnderlyingType(x interface{}) bool {
	return x == nil || reflect.DeepEqual(x, reflect.Zero(reflect.TypeOf(x)).Interface())
}
