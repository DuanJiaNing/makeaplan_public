package interceptors

import (
	"context"
	"time"

	"github.com/golang/protobuf/jsonpb"
	"github.com/golang/protobuf/proto"
	"google.golang.org/grpc"
)

func Statistic(ctx context.Context, req interface{}, info *grpc.UnaryServerInfo, handler grpc.UnaryHandler) (resp interface{}, err error) {
	start := time.Now()
	res, err := handler(ctx, req)
	cost := time.Since(start) / time.Millisecond
	if cost <= 1000 {
		return res, err
	}

	msg := req.(proto.Message)
	reqMsgJson, _ := (&jsonpb.Marshaler{OrigName: true}).MarshalToString(msg)
	resMsg := res.(proto.Message)
	resMsgJson, _ := (&jsonpb.Marshaler{OrigName: true}).MarshalToString(resMsg)
	PrintLog(ctx, "%s, %d ms, request: %d B, %s; response: %d B, %s", info.FullMethod, cost, proto.Size(msg), reqMsgJson, proto.Size(resMsg), resMsgJson)

	return res, err
}
