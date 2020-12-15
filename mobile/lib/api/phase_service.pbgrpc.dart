///
//  Generated code. Do not modify.
//  source: phase_service.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'phase_service.pb.dart' as $0;
export 'phase_service.pb.dart';

class PhaseQueryClient extends $grpc.Client {
  static final _$queryPlanPhaseSummary = $grpc.ClientMethod<
          $0.QueryPlanPhaseSummaryRequest, $0.QueryPlanPhaseSummaryResponse>(
      '/service.PhaseQuery/QueryPlanPhaseSummary',
      ($0.QueryPlanPhaseSummaryRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.QueryPlanPhaseSummaryResponse.fromBuffer(value));
  static final _$queryPhaseSummary = $grpc.ClientMethod<
          $0.QueryPhaseSummaryRequest, $0.QueryPhaseSummaryResponse>(
      '/service.PhaseQuery/QueryPhaseSummary',
      ($0.QueryPhaseSummaryRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.QueryPhaseSummaryResponse.fromBuffer(value));

  PhaseQueryClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options,
      $core.Iterable<$grpc.ClientInterceptor> interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.QueryPlanPhaseSummaryResponse> queryPlanPhaseSummary(
      $0.QueryPlanPhaseSummaryRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$queryPlanPhaseSummary, request, options: options);
  }

  $grpc.ResponseFuture<$0.QueryPhaseSummaryResponse> queryPhaseSummary(
      $0.QueryPhaseSummaryRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$queryPhaseSummary, request, options: options);
  }
}

abstract class PhaseQueryServiceBase extends $grpc.Service {
  $core.String get $name => 'service.PhaseQuery';

  PhaseQueryServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.QueryPlanPhaseSummaryRequest,
            $0.QueryPlanPhaseSummaryResponse>(
        'QueryPlanPhaseSummary',
        queryPlanPhaseSummary_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.QueryPlanPhaseSummaryRequest.fromBuffer(value),
        ($0.QueryPlanPhaseSummaryResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.QueryPhaseSummaryRequest,
            $0.QueryPhaseSummaryResponse>(
        'QueryPhaseSummary',
        queryPhaseSummary_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.QueryPhaseSummaryRequest.fromBuffer(value),
        ($0.QueryPhaseSummaryResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.QueryPlanPhaseSummaryResponse> queryPlanPhaseSummary_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.QueryPlanPhaseSummaryRequest> request) async {
    return queryPlanPhaseSummary(call, await request);
  }

  $async.Future<$0.QueryPhaseSummaryResponse> queryPhaseSummary_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.QueryPhaseSummaryRequest> request) async {
    return queryPhaseSummary(call, await request);
  }

  $async.Future<$0.QueryPlanPhaseSummaryResponse> queryPlanPhaseSummary(
      $grpc.ServiceCall call, $0.QueryPlanPhaseSummaryRequest request);
  $async.Future<$0.QueryPhaseSummaryResponse> queryPhaseSummary(
      $grpc.ServiceCall call, $0.QueryPhaseSummaryRequest request);
}

class PhaseModifyClient extends $grpc.Client {
  static final _$createPhase =
      $grpc.ClientMethod<$0.CreatePhaseRequest, $0.CreatePhaseResponse>(
          '/service.PhaseModify/CreatePhase',
          ($0.CreatePhaseRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.CreatePhaseResponse.fromBuffer(value));
  static final _$deletePhase =
      $grpc.ClientMethod<$0.DeletePhaseRequest, $0.DeletePhaseResponse>(
          '/service.PhaseModify/DeletePhase',
          ($0.DeletePhaseRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.DeletePhaseResponse.fromBuffer(value));
  static final _$updatePhase =
      $grpc.ClientMethod<$0.UpdatePhaseRequest, $0.UpdatePhaseResponse>(
          '/service.PhaseModify/UpdatePhase',
          ($0.UpdatePhaseRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.UpdatePhaseResponse.fromBuffer(value));

  PhaseModifyClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options,
      $core.Iterable<$grpc.ClientInterceptor> interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.CreatePhaseResponse> createPhase(
      $0.CreatePhaseRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$createPhase, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeletePhaseResponse> deletePhase(
      $0.DeletePhaseRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$deletePhase, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdatePhaseResponse> updatePhase(
      $0.UpdatePhaseRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$updatePhase, request, options: options);
  }
}

abstract class PhaseModifyServiceBase extends $grpc.Service {
  $core.String get $name => 'service.PhaseModify';

  PhaseModifyServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.CreatePhaseRequest, $0.CreatePhaseResponse>(
            'CreatePhase',
            createPhase_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.CreatePhaseRequest.fromBuffer(value),
            ($0.CreatePhaseResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.DeletePhaseRequest, $0.DeletePhaseResponse>(
            'DeletePhase',
            deletePhase_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.DeletePhaseRequest.fromBuffer(value),
            ($0.DeletePhaseResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.UpdatePhaseRequest, $0.UpdatePhaseResponse>(
            'UpdatePhase',
            updatePhase_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.UpdatePhaseRequest.fromBuffer(value),
            ($0.UpdatePhaseResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.CreatePhaseResponse> createPhase_Pre($grpc.ServiceCall call,
      $async.Future<$0.CreatePhaseRequest> request) async {
    return createPhase(call, await request);
  }

  $async.Future<$0.DeletePhaseResponse> deletePhase_Pre($grpc.ServiceCall call,
      $async.Future<$0.DeletePhaseRequest> request) async {
    return deletePhase(call, await request);
  }

  $async.Future<$0.UpdatePhaseResponse> updatePhase_Pre($grpc.ServiceCall call,
      $async.Future<$0.UpdatePhaseRequest> request) async {
    return updatePhase(call, await request);
  }

  $async.Future<$0.CreatePhaseResponse> createPhase(
      $grpc.ServiceCall call, $0.CreatePhaseRequest request);
  $async.Future<$0.DeletePhaseResponse> deletePhase(
      $grpc.ServiceCall call, $0.DeletePhaseRequest request);
  $async.Future<$0.UpdatePhaseResponse> updatePhase(
      $grpc.ServiceCall call, $0.UpdatePhaseRequest request);
}
