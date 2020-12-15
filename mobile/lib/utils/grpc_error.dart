import 'package:grpc/grpc.dart' as grpc;

class GRPCError {
  static bool noDataFound(e) {
    return (e is grpc.GrpcError && e.code == grpc.StatusCode.notFound);
  }

  static bool unavailable(e) {
    return (e is grpc.GrpcError &&
        (e.code == grpc.StatusCode.unavailable ||
            e.code == grpc.StatusCode.deadlineExceeded));
  }
}
