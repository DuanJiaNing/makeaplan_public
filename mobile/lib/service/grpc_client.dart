import 'package:grpc/grpc.dart' as grpc;
import 'package:makeaplan/manager/preference/preference_manager.dart';
import 'package:makeaplan/service/errors.dart';

const serverIP = "127.0.0.1";
const serverPort = 50051;

class GRPCClient {
  static GRPCClient _singleton;

  GRPCClient._internal();

  factory GRPCClient() {
    if (_singleton == null) {
      _singleton = GRPCClient._internal();
      _init();
    }
    return _singleton;
  }

  static grpc.ClientChannel _client;

  static _init() {
    _client = grpc.ClientChannel(
      serverIP,
      port: serverPort,
      options: grpc.ChannelOptions(
        credentials: grpc.ChannelCredentials.insecure(),
        idleTimeout: Duration(seconds: 10),
      ),
    );
  }

  verify() {
    if (_isShutdown) {
      throw ErrorCode.GRPC_CONNECTION_ALREADY_SHUTDOWN;
    }
  }

  grpc.ClientChannel client() {
    verify();
    return _client;
  }

  bool _isShutdown = false;

  Future<void> shutdown() async {
    verify();

    _isShutdown = true;
    _client.shutdown();
    _client = null;
  }
}

grpc.CallOptions getCommonCallOptions() {
  return grpc.CallOptions(
    timeout: Duration(seconds: 5),
    metadata: {
      "did": PreferenceManager().deviceId,
    },
  );
}
