///
//  Generated code. Do not modify.
//  source: plan_service.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'plan_service.pb.dart' as $0;
export 'plan_service.pb.dart';

class PlanQueryClient extends $grpc.Client {
  static final _$queryActivePlanSummary = $grpc.ClientMethod<
          $0.QueryActivePlanSummaryRequest, $0.QueryActivePlanSummaryResponse>(
      '/service.PlanQuery/QueryActivePlanSummary',
      ($0.QueryActivePlanSummaryRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.QueryActivePlanSummaryResponse.fromBuffer(value));
  static final _$queryArchivedPlan = $grpc.ClientMethod<
          $0.QueryArchivedPlanRequest, $0.QueryArchivedPlanResponse>(
      '/service.PlanQuery/QueryArchivedPlan',
      ($0.QueryArchivedPlanRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.QueryArchivedPlanResponse.fromBuffer(value));
  static final _$queryActivePlanIndex = $grpc.ClientMethod<
          $0.QueryActivePlanIndexRequest, $0.QueryActivePlanIndexResponse>(
      '/service.PlanQuery/QueryActivePlanIndex',
      ($0.QueryActivePlanIndexRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.QueryActivePlanIndexResponse.fromBuffer(value));
  static final _$queryPlanSummary = $grpc.ClientMethod<
          $0.QueryPlanSummaryRequest, $0.QueryPlanSummaryResponse>(
      '/service.PlanQuery/QueryPlanSummary',
      ($0.QueryPlanSummaryRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.QueryPlanSummaryResponse.fromBuffer(value));
  static final _$queryPlanCount =
      $grpc.ClientMethod<$0.QueryPlanCountRequest, $0.QueryPlanCountResponse>(
          '/service.PlanQuery/QueryPlanCount',
          ($0.QueryPlanCountRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.QueryPlanCountResponse.fromBuffer(value));

  PlanQueryClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options,
      $core.Iterable<$grpc.ClientInterceptor> interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.QueryActivePlanSummaryResponse>
      queryActivePlanSummary($0.QueryActivePlanSummaryRequest request,
          {$grpc.CallOptions options}) {
    return $createUnaryCall(_$queryActivePlanSummary, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.QueryArchivedPlanResponse> queryArchivedPlan(
      $0.QueryArchivedPlanRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$queryArchivedPlan, request, options: options);
  }

  $grpc.ResponseFuture<$0.QueryActivePlanIndexResponse> queryActivePlanIndex(
      $0.QueryActivePlanIndexRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$queryActivePlanIndex, request, options: options);
  }

  $grpc.ResponseFuture<$0.QueryPlanSummaryResponse> queryPlanSummary(
      $0.QueryPlanSummaryRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$queryPlanSummary, request, options: options);
  }

  $grpc.ResponseFuture<$0.QueryPlanCountResponse> queryPlanCount(
      $0.QueryPlanCountRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$queryPlanCount, request, options: options);
  }
}

abstract class PlanQueryServiceBase extends $grpc.Service {
  $core.String get $name => 'service.PlanQuery';

  PlanQueryServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.QueryActivePlanSummaryRequest,
            $0.QueryActivePlanSummaryResponse>(
        'QueryActivePlanSummary',
        queryActivePlanSummary_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.QueryActivePlanSummaryRequest.fromBuffer(value),
        ($0.QueryActivePlanSummaryResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.QueryArchivedPlanRequest,
            $0.QueryArchivedPlanResponse>(
        'QueryArchivedPlan',
        queryArchivedPlan_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.QueryArchivedPlanRequest.fromBuffer(value),
        ($0.QueryArchivedPlanResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.QueryActivePlanIndexRequest,
            $0.QueryActivePlanIndexResponse>(
        'QueryActivePlanIndex',
        queryActivePlanIndex_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.QueryActivePlanIndexRequest.fromBuffer(value),
        ($0.QueryActivePlanIndexResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.QueryPlanSummaryRequest,
            $0.QueryPlanSummaryResponse>(
        'QueryPlanSummary',
        queryPlanSummary_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.QueryPlanSummaryRequest.fromBuffer(value),
        ($0.QueryPlanSummaryResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.QueryPlanCountRequest,
            $0.QueryPlanCountResponse>(
        'QueryPlanCount',
        queryPlanCount_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.QueryPlanCountRequest.fromBuffer(value),
        ($0.QueryPlanCountResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.QueryActivePlanSummaryResponse> queryActivePlanSummary_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.QueryActivePlanSummaryRequest> request) async {
    return queryActivePlanSummary(call, await request);
  }

  $async.Future<$0.QueryArchivedPlanResponse> queryArchivedPlan_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.QueryArchivedPlanRequest> request) async {
    return queryArchivedPlan(call, await request);
  }

  $async.Future<$0.QueryActivePlanIndexResponse> queryActivePlanIndex_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.QueryActivePlanIndexRequest> request) async {
    return queryActivePlanIndex(call, await request);
  }

  $async.Future<$0.QueryPlanSummaryResponse> queryPlanSummary_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.QueryPlanSummaryRequest> request) async {
    return queryPlanSummary(call, await request);
  }

  $async.Future<$0.QueryPlanCountResponse> queryPlanCount_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.QueryPlanCountRequest> request) async {
    return queryPlanCount(call, await request);
  }

  $async.Future<$0.QueryActivePlanSummaryResponse> queryActivePlanSummary(
      $grpc.ServiceCall call, $0.QueryActivePlanSummaryRequest request);
  $async.Future<$0.QueryArchivedPlanResponse> queryArchivedPlan(
      $grpc.ServiceCall call, $0.QueryArchivedPlanRequest request);
  $async.Future<$0.QueryActivePlanIndexResponse> queryActivePlanIndex(
      $grpc.ServiceCall call, $0.QueryActivePlanIndexRequest request);
  $async.Future<$0.QueryPlanSummaryResponse> queryPlanSummary(
      $grpc.ServiceCall call, $0.QueryPlanSummaryRequest request);
  $async.Future<$0.QueryPlanCountResponse> queryPlanCount(
      $grpc.ServiceCall call, $0.QueryPlanCountRequest request);
}

class PlanModifyClient extends $grpc.Client {
  static final _$createPlan =
      $grpc.ClientMethod<$0.CreatePlanRequest, $0.CreatePlanResponse>(
          '/service.PlanModify/CreatePlan',
          ($0.CreatePlanRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.CreatePlanResponse.fromBuffer(value));
  static final _$deletePlan =
      $grpc.ClientMethod<$0.DeletePlanRequest, $0.DeletePlanResponse>(
          '/service.PlanModify/DeletePlan',
          ($0.DeletePlanRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.DeletePlanResponse.fromBuffer(value));
  static final _$updatePlan =
      $grpc.ClientMethod<$0.UpdatePlanRequest, $0.UpdatePlanResponse>(
          '/service.PlanModify/UpdatePlan',
          ($0.UpdatePlanRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.UpdatePlanResponse.fromBuffer(value));
  static final _$updatePlanArchiveState = $grpc.ClientMethod<
          $0.UpdatePlanArchiveStateRequest, $0.UpdatePlanArchiveStateResponse>(
      '/service.PlanModify/UpdatePlanArchiveState',
      ($0.UpdatePlanArchiveStateRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.UpdatePlanArchiveStateResponse.fromBuffer(value));
  static final _$updatePlanCompletedIndex = $grpc.ClientMethod<
          $0.UpdatePlanCompletedIndexRequest,
          $0.UpdatePlanCompletedIndexResponse>(
      '/service.PlanModify/UpdatePlanCompletedIndex',
      ($0.UpdatePlanCompletedIndexRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.UpdatePlanCompletedIndexResponse.fromBuffer(value));

  PlanModifyClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options,
      $core.Iterable<$grpc.ClientInterceptor> interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.CreatePlanResponse> createPlan(
      $0.CreatePlanRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$createPlan, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeletePlanResponse> deletePlan(
      $0.DeletePlanRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$deletePlan, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdatePlanResponse> updatePlan(
      $0.UpdatePlanRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$updatePlan, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdatePlanArchiveStateResponse>
      updatePlanArchiveState($0.UpdatePlanArchiveStateRequest request,
          {$grpc.CallOptions options}) {
    return $createUnaryCall(_$updatePlanArchiveState, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.UpdatePlanCompletedIndexResponse>
      updatePlanCompletedIndex($0.UpdatePlanCompletedIndexRequest request,
          {$grpc.CallOptions options}) {
    return $createUnaryCall(_$updatePlanCompletedIndex, request,
        options: options);
  }
}

abstract class PlanModifyServiceBase extends $grpc.Service {
  $core.String get $name => 'service.PlanModify';

  PlanModifyServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreatePlanRequest, $0.CreatePlanResponse>(
        'CreatePlan',
        createPlan_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreatePlanRequest.fromBuffer(value),
        ($0.CreatePlanResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeletePlanRequest, $0.DeletePlanResponse>(
        'DeletePlan',
        deletePlan_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeletePlanRequest.fromBuffer(value),
        ($0.DeletePlanResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdatePlanRequest, $0.UpdatePlanResponse>(
        'UpdatePlan',
        updatePlan_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdatePlanRequest.fromBuffer(value),
        ($0.UpdatePlanResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdatePlanArchiveStateRequest,
            $0.UpdatePlanArchiveStateResponse>(
        'UpdatePlanArchiveState',
        updatePlanArchiveState_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpdatePlanArchiveStateRequest.fromBuffer(value),
        ($0.UpdatePlanArchiveStateResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdatePlanCompletedIndexRequest,
            $0.UpdatePlanCompletedIndexResponse>(
        'UpdatePlanCompletedIndex',
        updatePlanCompletedIndex_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpdatePlanCompletedIndexRequest.fromBuffer(value),
        ($0.UpdatePlanCompletedIndexResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.CreatePlanResponse> createPlan_Pre($grpc.ServiceCall call,
      $async.Future<$0.CreatePlanRequest> request) async {
    return createPlan(call, await request);
  }

  $async.Future<$0.DeletePlanResponse> deletePlan_Pre($grpc.ServiceCall call,
      $async.Future<$0.DeletePlanRequest> request) async {
    return deletePlan(call, await request);
  }

  $async.Future<$0.UpdatePlanResponse> updatePlan_Pre($grpc.ServiceCall call,
      $async.Future<$0.UpdatePlanRequest> request) async {
    return updatePlan(call, await request);
  }

  $async.Future<$0.UpdatePlanArchiveStateResponse> updatePlanArchiveState_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.UpdatePlanArchiveStateRequest> request) async {
    return updatePlanArchiveState(call, await request);
  }

  $async.Future<$0.UpdatePlanCompletedIndexResponse>
      updatePlanCompletedIndex_Pre($grpc.ServiceCall call,
          $async.Future<$0.UpdatePlanCompletedIndexRequest> request) async {
    return updatePlanCompletedIndex(call, await request);
  }

  $async.Future<$0.CreatePlanResponse> createPlan(
      $grpc.ServiceCall call, $0.CreatePlanRequest request);
  $async.Future<$0.DeletePlanResponse> deletePlan(
      $grpc.ServiceCall call, $0.DeletePlanRequest request);
  $async.Future<$0.UpdatePlanResponse> updatePlan(
      $grpc.ServiceCall call, $0.UpdatePlanRequest request);
  $async.Future<$0.UpdatePlanArchiveStateResponse> updatePlanArchiveState(
      $grpc.ServiceCall call, $0.UpdatePlanArchiveStateRequest request);
  $async.Future<$0.UpdatePlanCompletedIndexResponse> updatePlanCompletedIndex(
      $grpc.ServiceCall call, $0.UpdatePlanCompletedIndexRequest request);
}
