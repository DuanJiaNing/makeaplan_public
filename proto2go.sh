ROOT=api/v1
SERVICE_ROOT=service/makeaplan
#FILES=*.proto
FILES=greeter_service.proto

protoc -I $ROOT --go_out=$SERVICE_ROOT/pb $ROOT/$FILES
protoc -I $ROOT --go-grpc_out=$SERVICE_ROOT/pb $ROOT/$FILES
