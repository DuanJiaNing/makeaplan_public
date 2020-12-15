package interceptors

import (
	"context"
	"fmt"
	"log"
)

func PrintLog(ctx context.Context, format string, v ...interface{}) {
	var uid string
	u := ctx.Value(UID)
	if u != nil {
		uid = fmt.Sprintf("%d", u.(uint32))
	}

	var did string
	d := ctx.Value(DID)
	if d != nil {
		did = d.(string)
	}

	log.Printf("[%s] [%s] %s", uid, did, fmt.Sprintf(format, v...))
}
