///
//  Generated code. Do not modify.
//  source: task_service.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'task_service.pb.dart' as $0;
export 'task_service.pb.dart';

class TaskQueryClient extends $grpc.Client {
  static final _$queryPlanTask =
      $grpc.ClientMethod<$0.QueryPlanTaskRequest, $0.QueryPlanTaskResponse>(
          '/service.TaskQuery/QueryPlanTask',
          ($0.QueryPlanTaskRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.QueryPlanTaskResponse.fromBuffer(value));
  static final _$queryTask =
      $grpc.ClientMethod<$0.QueryTaskRequest, $0.QueryTaskResponse>(
          '/service.TaskQuery/QueryTask',
          ($0.QueryTaskRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.QueryTaskResponse.fromBuffer(value));

  TaskQueryClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options,
      $core.Iterable<$grpc.ClientInterceptor> interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.QueryPlanTaskResponse> queryPlanTask(
      $0.QueryPlanTaskRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$queryPlanTask, request, options: options);
  }

  $grpc.ResponseFuture<$0.QueryTaskResponse> queryTask(
      $0.QueryTaskRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$queryTask, request, options: options);
  }
}

abstract class TaskQueryServiceBase extends $grpc.Service {
  $core.String get $name => 'service.TaskQuery';

  TaskQueryServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.QueryPlanTaskRequest, $0.QueryPlanTaskResponse>(
            'QueryPlanTask',
            queryPlanTask_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.QueryPlanTaskRequest.fromBuffer(value),
            ($0.QueryPlanTaskResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.QueryTaskRequest, $0.QueryTaskResponse>(
        'QueryTask',
        queryTask_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.QueryTaskRequest.fromBuffer(value),
        ($0.QueryTaskResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.QueryPlanTaskResponse> queryPlanTask_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.QueryPlanTaskRequest> request) async {
    return queryPlanTask(call, await request);
  }

  $async.Future<$0.QueryTaskResponse> queryTask_Pre($grpc.ServiceCall call,
      $async.Future<$0.QueryTaskRequest> request) async {
    return queryTask(call, await request);
  }

  $async.Future<$0.QueryPlanTaskResponse> queryPlanTask(
      $grpc.ServiceCall call, $0.QueryPlanTaskRequest request);
  $async.Future<$0.QueryTaskResponse> queryTask(
      $grpc.ServiceCall call, $0.QueryTaskRequest request);
}

class TaskModifyClient extends $grpc.Client {
  static final _$createTask =
      $grpc.ClientMethod<$0.CreateTaskRequest, $0.CreateTaskResponse>(
          '/service.TaskModify/CreateTask',
          ($0.CreateTaskRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.CreateTaskResponse.fromBuffer(value));
  static final _$updateTask =
      $grpc.ClientMethod<$0.UpdateTaskRequest, $0.UpdateTaskResponse>(
          '/service.TaskModify/UpdateTask',
          ($0.UpdateTaskRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.UpdateTaskResponse.fromBuffer(value));
  static final _$deleteTask =
      $grpc.ClientMethod<$0.DeleteTaskRequest, $0.DeleteTaskResponse>(
          '/service.TaskModify/DeleteTask',
          ($0.DeleteTaskRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.DeleteTaskResponse.fromBuffer(value));
  static final _$updateTaskCheckState = $grpc.ClientMethod<
          $0.UpdateTaskCheckStateRequest, $0.UpdateTaskCheckStateResponse>(
      '/service.TaskModify/UpdateTaskCheckState',
      ($0.UpdateTaskCheckStateRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.UpdateTaskCheckStateResponse.fromBuffer(value));

  TaskModifyClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options,
      $core.Iterable<$grpc.ClientInterceptor> interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.CreateTaskResponse> createTask(
      $0.CreateTaskRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$createTask, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateTaskResponse> updateTask(
      $0.UpdateTaskRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$updateTask, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteTaskResponse> deleteTask(
      $0.DeleteTaskRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$deleteTask, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateTaskCheckStateResponse> updateTaskCheckState(
      $0.UpdateTaskCheckStateRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$updateTaskCheckState, request, options: options);
  }
}

abstract class TaskModifyServiceBase extends $grpc.Service {
  $core.String get $name => 'service.TaskModify';

  TaskModifyServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateTaskRequest, $0.CreateTaskResponse>(
        'CreateTask',
        createTask_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateTaskRequest.fromBuffer(value),
        ($0.CreateTaskResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateTaskRequest, $0.UpdateTaskResponse>(
        'UpdateTask',
        updateTask_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateTaskRequest.fromBuffer(value),
        ($0.UpdateTaskResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteTaskRequest, $0.DeleteTaskResponse>(
        'DeleteTask',
        deleteTask_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteTaskRequest.fromBuffer(value),
        ($0.DeleteTaskResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateTaskCheckStateRequest,
            $0.UpdateTaskCheckStateResponse>(
        'UpdateTaskCheckState',
        updateTaskCheckState_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpdateTaskCheckStateRequest.fromBuffer(value),
        ($0.UpdateTaskCheckStateResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.CreateTaskResponse> createTask_Pre($grpc.ServiceCall call,
      $async.Future<$0.CreateTaskRequest> request) async {
    return createTask(call, await request);
  }

  $async.Future<$0.UpdateTaskResponse> updateTask_Pre($grpc.ServiceCall call,
      $async.Future<$0.UpdateTaskRequest> request) async {
    return updateTask(call, await request);
  }

  $async.Future<$0.DeleteTaskResponse> deleteTask_Pre($grpc.ServiceCall call,
      $async.Future<$0.DeleteTaskRequest> request) async {
    return deleteTask(call, await request);
  }

  $async.Future<$0.UpdateTaskCheckStateResponse> updateTaskCheckState_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.UpdateTaskCheckStateRequest> request) async {
    return updateTaskCheckState(call, await request);
  }

  $async.Future<$0.CreateTaskResponse> createTask(
      $grpc.ServiceCall call, $0.CreateTaskRequest request);
  $async.Future<$0.UpdateTaskResponse> updateTask(
      $grpc.ServiceCall call, $0.UpdateTaskRequest request);
  $async.Future<$0.DeleteTaskResponse> deleteTask(
      $grpc.ServiceCall call, $0.DeleteTaskRequest request);
  $async.Future<$0.UpdateTaskCheckStateResponse> updateTaskCheckState(
      $grpc.ServiceCall call, $0.UpdateTaskCheckStateRequest request);
}
