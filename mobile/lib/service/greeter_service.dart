import 'package:makeaplan/api/greeter_service.pb.dart' as pb;
import 'package:makeaplan/api/greeter_service.pbgrpc.dart' as grpc;
import 'package:makeaplan/model/user_profile.dart';

import 'grpc_client.dart';

class GreeterService {
  static GreeterService _singleton;

  GreeterService._internal();

  factory GreeterService() {
    if (_singleton == null) {
      _singleton = GreeterService._internal();
    }
    return _singleton;
  }

  grpc.GreeterClient _client() {
    return grpc.GreeterClient(
      GRPCClient().client(),
      options: getCommonCallOptions(),
    );
  }

  Future<bool> sayHello() async {
    print("GreeterService.sayHello");
    try {
      await _client().sayHello(pb.HelloRequest.create());
      return true;
    } catch (err) {
      if (err.message == "who is this") {
        return false;
      } else {
        throw err;
      }
    }
  }

  Future<UserProfile> getUserProfile() async {
    print("GreeterService.getUserProfile");
    final v = await _client().sayHello(pb.HelloRequest.create());
    final sps = v.message.split(", ");
    final username = sps[1];
    final dataID = sps[2];
    UserProfile up = UserProfile();
    if (username != "***") {
      up.username = username;
    }
    if (dataID != "***") {
      up.dataID = dataID;
    }

    return up;
  }

  Future<void> start() async {
    print("GreeterService.start");
    await _client().start(pb.StartRequest.create());
  }

  Future<void> updateUsername(String un) async {
    print("GreeterService.updateUsername");
    await _client()
        .updateUsername(pb.UpdateUsernameRequest.create()..username = un);
  }

  Future<void> updateDeviceID(String did) async {
    print("GreeterService.updateDeviceID");
    await Future.delayed(Duration(seconds: 2));
    await _client()
        .updateDeviceID(pb.UpdateDeviceIDRequest.create()..dataId = did);
  }

  Future<void> initPerSetPlan(int id) async {
    print("GreeterService.initPerSetPlan");
    await _client().initPerSetPlan(pb.InitPerSetPlanRequest.create()..id = id);
  }
}
