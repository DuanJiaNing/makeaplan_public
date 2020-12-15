package interceptors

import (
	"context"
	"errors"
	"strings"

	"google.golang.org/grpc"
	"google.golang.org/grpc/metadata"

	"makeaplan.com/dao"
)

type uidInContext int
type didInContext int

const UID = uidInContext(1)
const DID = didInContext(2)

var noGuardRequiredService = []string{
	"/service.Greeter/Start",
	"/service.Greeter/UpdateDeviceID",
}

func Guard(ctx context.Context, req interface{}, info *grpc.UnaryServerInfo, handler grpc.UnaryHandler) (resp interface{}, err error) {
	md, ok := metadata.FromIncomingContext(ctx)
	if !ok {
		return nil, errors.New("missing metadata in context")
	}

	get := md["did"]
	if len(get) == 0 || len(strings.TrimSpace(get[0])) == 0 {
		return nil, errors.New("DID is missing")
	}

	did := get[0]
	ctx = context.WithValue(ctx, DID, did)

	for _, s := range noGuardRequiredService {
		if info.FullMethod == s {
			return handler(ctx, req)
		}
	}

	user, err := dao.FindUser(ctx, did)
	if err == dao.ErrNotFound {
		return nil, errors.New("who is this")
	}
	if err != nil {
		return nil, err
	}

	ctx = context.WithValue(ctx, UID, user.ID)
	return handler(ctx, req)
}
