ROOT=api/v1
GOOGLE_PROTOBUF_ROOT=mobile/proto
CLIENT_ROOT=mobile/lib

#protoc -I $GOOGLE_PROTOBUF_ROOT --dart_out=$CLIENT_ROOT/api/google/protobuf $GOOGLE_PROTOBUF_ROOT/*.proto

protoc -I $ROOT --dart_out=$CLIENT_ROOT/api $ROOT/blog.proto
protoc -I $ROOT --dart_out=grpc:$CLIENT_ROOT/api $ROOT/blog_service.proto

protoc -I $ROOT --dart_out=grpc:$CLIENT_ROOT/api $ROOT/greeter_service.proto
protoc -I $ROOT --dart_out=$CLIENT_ROOT/api $ROOT/common.proto
protoc -I $ROOT --dart_out=$CLIENT_ROOT/api $ROOT/statistics.proto

protoc -I $ROOT --dart_out=$CLIENT_ROOT/api $ROOT/phase.proto
protoc -I $ROOT --dart_out=grpc:$CLIENT_ROOT/api $ROOT/phase_service.proto

protoc -I $ROOT --dart_out=$CLIENT_ROOT/api $ROOT/plan.proto
protoc -I $ROOT --dart_out=grpc:$CLIENT_ROOT/api $ROOT/plan_service.proto

protoc -I $ROOT --dart_out=$CLIENT_ROOT/api $ROOT/task.proto
protoc -I $ROOT --dart_out=grpc:$CLIENT_ROOT/api $ROOT/task_service.proto

# 生成完成后手动删除 *.pbserver.dart 文件。