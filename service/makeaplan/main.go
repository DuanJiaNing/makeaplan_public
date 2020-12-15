package main

import (
	"log"
	"net"

	"google.golang.org/grpc"

	"makeaplan.com/dao"
	"makeaplan.com/interceptors"
	"makeaplan.com/service"
)

const (
	address = ":50051"
)

func main() {
	lis, err := net.Listen("tcp", address)
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}

	log.Println("1. init DB ...")
	err = dao.Init()
	if err != nil {
		log.Fatalf("failed to init db: %v", err)
	}
	defer dao.Close()
	log.Println("connected")

	s := grpc.NewServer(grpc.ChainUnaryInterceptor(
		interceptors.Error,
		interceptors.Guard,
		interceptors.Statistic,
	))

	// Register services.
	log.Println("2. register services ...")
	service.RegisterPlanService(s)
	service.RegisterPhaseService(s)
	service.RegisterTaskService(s)
	service.RegisterGreeterService(s)
	service.RegisterBlogService(s)

	log.Printf("3. starting server listening at %s ...", address)
	if err := s.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %v", err)
	}
}
