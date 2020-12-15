package service

import (
	"context"

	"google.golang.org/grpc"

	pb "makeaplan.com/api/model"
	"makeaplan.com/api/service"
	"makeaplan.com/dao"
)

type blogService struct {
}

func RegisterBlogService(server *grpc.Server) {
	service.RegisterBlogQueryService(server, service.NewBlogQueryService(&blogService{}))
}

func (g *blogService) QueryAllBlog(ctx context.Context, request *service.QueryAllBlogRequest) (*service.QueryAllBlogReply, error) {
	blgs, err := dao.GetAllBlog(ctx)
	if err != nil {
		return nil, err
	}

	bs := make([]*pb.Blog, 0, len(blgs))
	for _, b := range blgs {
		bs = append(bs, b.AsPBPlan())
	}
	return &service.QueryAllBlogReply{Blogs: bs}, nil
}
