package interceptors

import (
	"context"
	"reflect"

	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func Error(ctx context.Context, req interface{}, info *grpc.UnaryServerInfo, handler grpc.UnaryHandler) (resp interface{}, err error) {
	defer func() {
		if err := recover(); err != nil {
			PrintLog(ctx, "panic recovered: %s", err)
		}
	}()

	res, err := handler(ctx, req)

	if err != nil {
		PrintLog(ctx, "error: %s", err)
	}

	if err == nil && reflect.ValueOf(res).IsNil() {
		return nil, status.Error(codes.NotFound, "no data found")
	}

	return res, err
}
