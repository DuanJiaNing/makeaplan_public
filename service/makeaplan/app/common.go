package app

import (
	"context"
	"fmt"
	"log"
	"strings"
	"time"

	"github.com/golang/protobuf/ptypes/wrappers"
	"github.com/guregu/null"

	pb "makeaplan.com/api/model"
	"makeaplan.com/dao"
	"makeaplan.com/interceptors"
	"makeaplan.com/model"
)

func TaskStatis(planId uint32, phaseId *uint32) (*pb.Statistics, error) {
	ts, err := dao.GetPlanTask(planId, phaseId)
	if err != nil {
		return nil, err
	}

	var c int32 = 0
	for _, t := range ts {
		if t.Checked == model.TaskChecked {
			c++
		}
	}

	return &pb.Statistics{
		Completed: c,
		Total:     int32(len(ts)),
	}, nil
}

func TimeBasedStatus(startTime, endTime null.Time) pb.CommonStatus {
	now := time.Now()
	if startTime.Valid && endTime.Valid {
		if now.Before(startTime.Time) {
			return pb.CommonStatus_NOT_STARTED_YET
		}
		if now.After(startTime.Time) && now.Before(endTime.Time) {
			return pb.CommonStatus_IN_PROGRESS
		}
		return pb.CommonStatus_FINISHED
	}

	if startTime.Valid {
		if now.Before(startTime.Time) {
			return pb.CommonStatus_NOT_STARTED_YET
		}
		return pb.CommonStatus_IN_PROGRESS
	}

	if endTime.Valid {
		if now.After(endTime.Time) {
			return pb.CommonStatus_FINISHED
		}
	}

	return pb.CommonStatus_UNKNOWN_COMMON_STATUS
}

func IsBlankString(str *wrappers.StringValue) bool {
	return str == nil || strings.TrimSpace(str.GetValue()) == ""
}

func UIDFromContext(ctx context.Context) uint32 {
	v := ctx.Value(interceptors.UID)
	return v.(uint32)
}

func DIDFromContext(ctx context.Context) string {
	v := ctx.Value(interceptors.DID)
	return v.(string)
}

func Printf(ctx context.Context, format string, v ...interface{}) {
	var uid string
	u := ctx.Value(interceptors.UID)
	if u != nil {
		uid = fmt.Sprintf("%d", u.(uint32))
	}

	var did string
	d := ctx.Value(interceptors.DID)
	if d != nil {
		did = d.(string)
	}

	log.Printf("[%s] [%s] %s", uid, did, fmt.Sprintf(format, v...))
}
