///
//  Generated code. Do not modify.
//  source: greeter_service.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'greeter_service.pb.dart' as $0;
export 'greeter_service.pb.dart';

class GreeterClient extends $grpc.Client {
  static final _$sayHello = $grpc.ClientMethod<$0.HelloRequest, $0.HelloReply>(
      '/service.Greeter/SayHello',
      ($0.HelloRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.HelloReply.fromBuffer(value));
  static final _$start = $grpc.ClientMethod<$0.StartRequest, $0.StartReply>(
      '/service.Greeter/Start',
      ($0.StartRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.StartReply.fromBuffer(value));
  static final _$updateUsername =
      $grpc.ClientMethod<$0.UpdateUsernameRequest, $0.UpdateUsernameReply>(
          '/service.Greeter/UpdateUsername',
          ($0.UpdateUsernameRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.UpdateUsernameReply.fromBuffer(value));
  static final _$updateDeviceID =
      $grpc.ClientMethod<$0.UpdateDeviceIDRequest, $0.UpdateDeviceIDReply>(
          '/service.Greeter/UpdateDeviceID',
          ($0.UpdateDeviceIDRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.UpdateDeviceIDReply.fromBuffer(value));
  static final _$initPerSetPlan =
      $grpc.ClientMethod<$0.InitPerSetPlanRequest, $0.InitPerSetPlanReply>(
          '/service.Greeter/InitPerSetPlan',
          ($0.InitPerSetPlanRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.InitPerSetPlanReply.fromBuffer(value));

  GreeterClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options,
      $core.Iterable<$grpc.ClientInterceptor> interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.HelloReply> sayHello($0.HelloRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$sayHello, request, options: options);
  }

  $grpc.ResponseFuture<$0.StartReply> start($0.StartRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$start, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateUsernameReply> updateUsername(
      $0.UpdateUsernameRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$updateUsername, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateDeviceIDReply> updateDeviceID(
      $0.UpdateDeviceIDRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$updateDeviceID, request, options: options);
  }

  $grpc.ResponseFuture<$0.InitPerSetPlanReply> initPerSetPlan(
      $0.InitPerSetPlanRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$initPerSetPlan, request, options: options);
  }
}

abstract class GreeterServiceBase extends $grpc.Service {
  $core.String get $name => 'service.Greeter';

  GreeterServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.HelloRequest, $0.HelloReply>(
        'SayHello',
        sayHello_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.HelloRequest.fromBuffer(value),
        ($0.HelloReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.StartRequest, $0.StartReply>(
        'Start',
        start_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.StartRequest.fromBuffer(value),
        ($0.StartReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.UpdateUsernameRequest, $0.UpdateUsernameReply>(
            'UpdateUsername',
            updateUsername_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.UpdateUsernameRequest.fromBuffer(value),
            ($0.UpdateUsernameReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.UpdateDeviceIDRequest, $0.UpdateDeviceIDReply>(
            'UpdateDeviceID',
            updateDeviceID_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.UpdateDeviceIDRequest.fromBuffer(value),
            ($0.UpdateDeviceIDReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.InitPerSetPlanRequest, $0.InitPerSetPlanReply>(
            'InitPerSetPlan',
            initPerSetPlan_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.InitPerSetPlanRequest.fromBuffer(value),
            ($0.InitPerSetPlanReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.HelloReply> sayHello_Pre(
      $grpc.ServiceCall call, $async.Future<$0.HelloRequest> request) async {
    return sayHello(call, await request);
  }

  $async.Future<$0.StartReply> start_Pre(
      $grpc.ServiceCall call, $async.Future<$0.StartRequest> request) async {
    return start(call, await request);
  }

  $async.Future<$0.UpdateUsernameReply> updateUsername_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.UpdateUsernameRequest> request) async {
    return updateUsername(call, await request);
  }

  $async.Future<$0.UpdateDeviceIDReply> updateDeviceID_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.UpdateDeviceIDRequest> request) async {
    return updateDeviceID(call, await request);
  }

  $async.Future<$0.InitPerSetPlanReply> initPerSetPlan_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.InitPerSetPlanRequest> request) async {
    return initPerSetPlan(call, await request);
  }

  $async.Future<$0.HelloReply> sayHello(
      $grpc.ServiceCall call, $0.HelloRequest request);
  $async.Future<$0.StartReply> start(
      $grpc.ServiceCall call, $0.StartRequest request);
  $async.Future<$0.UpdateUsernameReply> updateUsername(
      $grpc.ServiceCall call, $0.UpdateUsernameRequest request);
  $async.Future<$0.UpdateDeviceIDReply> updateDeviceID(
      $grpc.ServiceCall call, $0.UpdateDeviceIDRequest request);
  $async.Future<$0.InitPerSetPlanReply> initPerSetPlan(
      $grpc.ServiceCall call, $0.InitPerSetPlanRequest request);
}
