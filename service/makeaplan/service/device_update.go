package service

import (
	"context"
	"sync"
	"time"

	"makeaplan.com/app"
)

type rec struct {
	time       time.Time
	to         string
	usedDataID string
}

var updateDeviceIDTimesMap = make(map[string][]rec)
var mutex = sync.Mutex{}

const updateDeviceIDTimesQuotaPreDay = 3

func reachQuota(ctx context.Context, to, usedDataID string) bool {
	now := time.Now()
	ds := time.Date(now.Year(), now.Month(), now.Day(), 0, 0, 0, 0, time.UTC)
	de := time.Date(now.Year(), now.Month(), now.Day(), 23, 59, 59, 0, time.UTC)
	newRec := rec{
		time:       now,
		to:         to,
		usedDataID: usedDataID,
	}
	app.Printf(ctx, "reachQuota check for deviceID update. to_did: %s, usedDataID: %s\n", to, usedDataID)

	mutex.Lock()
	defer mutex.Unlock()

	recs, ok := updateDeviceIDTimesMap[to]
	if !ok {
		updateDeviceIDTimesMap[to] = []rec{newRec}
		return false
	}

	var todayRec []rec
	for _, r := range recs {
		if r.time.After(ds) && r.time.Before(de) {
			todayRec = append(todayRec, r)
		}
	}
	updateDeviceIDTimesMap[to] = todayRec
	if len(todayRec) == updateDeviceIDTimesQuotaPreDay {
		return true
	}

	updateDeviceIDTimesMap[to] = append(updateDeviceIDTimesMap[to], newRec)
	return false
}
