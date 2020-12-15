///
//  Generated code. Do not modify.
//  source: plan_service.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'plan.pb.dart' as $1;
import 'google/protobuf/wrappers.pb.dart' as $2;
import 'google/protobuf/timestamp.pb.dart' as $3;

import 'plan.pbenum.dart' as $1;

class QueryPlanCountRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryPlanCountRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  QueryPlanCountRequest._() : super();
  factory QueryPlanCountRequest() => create();
  factory QueryPlanCountRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryPlanCountRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryPlanCountRequest clone() => QueryPlanCountRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryPlanCountRequest copyWith(void Function(QueryPlanCountRequest) updates) => super.copyWith((message) => updates(message as QueryPlanCountRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryPlanCountRequest create() => QueryPlanCountRequest._();
  QueryPlanCountRequest createEmptyInstance() => create();
  static $pb.PbList<QueryPlanCountRequest> createRepeated() => $pb.PbList<QueryPlanCountRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryPlanCountRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryPlanCountRequest>(create);
  static QueryPlanCountRequest _defaultInstance;
}

class QueryPlanCountResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryPlanCountResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'activePlanCount', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'archivedPlanCount', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  QueryPlanCountResponse._() : super();
  factory QueryPlanCountResponse() => create();
  factory QueryPlanCountResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryPlanCountResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryPlanCountResponse clone() => QueryPlanCountResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryPlanCountResponse copyWith(void Function(QueryPlanCountResponse) updates) => super.copyWith((message) => updates(message as QueryPlanCountResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryPlanCountResponse create() => QueryPlanCountResponse._();
  QueryPlanCountResponse createEmptyInstance() => create();
  static $pb.PbList<QueryPlanCountResponse> createRepeated() => $pb.PbList<QueryPlanCountResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryPlanCountResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryPlanCountResponse>(create);
  static QueryPlanCountResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get activePlanCount => $_getIZ(0);
  @$pb.TagNumber(1)
  set activePlanCount($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasActivePlanCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearActivePlanCount() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get archivedPlanCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set archivedPlanCount($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasArchivedPlanCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearArchivedPlanCount() => clearField(2);
}

class QueryArchivedPlanRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryArchivedPlanRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  QueryArchivedPlanRequest._() : super();
  factory QueryArchivedPlanRequest() => create();
  factory QueryArchivedPlanRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryArchivedPlanRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryArchivedPlanRequest clone() => QueryArchivedPlanRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryArchivedPlanRequest copyWith(void Function(QueryArchivedPlanRequest) updates) => super.copyWith((message) => updates(message as QueryArchivedPlanRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryArchivedPlanRequest create() => QueryArchivedPlanRequest._();
  QueryArchivedPlanRequest createEmptyInstance() => create();
  static $pb.PbList<QueryArchivedPlanRequest> createRepeated() => $pb.PbList<QueryArchivedPlanRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryArchivedPlanRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryArchivedPlanRequest>(create);
  static QueryArchivedPlanRequest _defaultInstance;
}

class QueryActivePlanIndexRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryActivePlanIndexRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  QueryActivePlanIndexRequest._() : super();
  factory QueryActivePlanIndexRequest() => create();
  factory QueryActivePlanIndexRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryActivePlanIndexRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryActivePlanIndexRequest clone() => QueryActivePlanIndexRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryActivePlanIndexRequest copyWith(void Function(QueryActivePlanIndexRequest) updates) => super.copyWith((message) => updates(message as QueryActivePlanIndexRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryActivePlanIndexRequest create() => QueryActivePlanIndexRequest._();
  QueryActivePlanIndexRequest createEmptyInstance() => create();
  static $pb.PbList<QueryActivePlanIndexRequest> createRepeated() => $pb.PbList<QueryActivePlanIndexRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryActivePlanIndexRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryActivePlanIndexRequest>(create);
  static QueryActivePlanIndexRequest _defaultInstance;
}

class QueryActivePlanIndexResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryActivePlanIndexResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..p<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ids', $pb.PbFieldType.P3)
    ..hasRequiredFields = false
  ;

  QueryActivePlanIndexResponse._() : super();
  factory QueryActivePlanIndexResponse() => create();
  factory QueryActivePlanIndexResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryActivePlanIndexResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryActivePlanIndexResponse clone() => QueryActivePlanIndexResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryActivePlanIndexResponse copyWith(void Function(QueryActivePlanIndexResponse) updates) => super.copyWith((message) => updates(message as QueryActivePlanIndexResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryActivePlanIndexResponse create() => QueryActivePlanIndexResponse._();
  QueryActivePlanIndexResponse createEmptyInstance() => create();
  static $pb.PbList<QueryActivePlanIndexResponse> createRepeated() => $pb.PbList<QueryActivePlanIndexResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryActivePlanIndexResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryActivePlanIndexResponse>(create);
  static QueryActivePlanIndexResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ids => $_getList(0);
}

class QueryPlanSummaryResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryPlanSummaryResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..aOM<$1.PlanSummary>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'planSummary', subBuilder: $1.PlanSummary.create)
    ..hasRequiredFields = false
  ;

  QueryPlanSummaryResponse._() : super();
  factory QueryPlanSummaryResponse() => create();
  factory QueryPlanSummaryResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryPlanSummaryResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryPlanSummaryResponse clone() => QueryPlanSummaryResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryPlanSummaryResponse copyWith(void Function(QueryPlanSummaryResponse) updates) => super.copyWith((message) => updates(message as QueryPlanSummaryResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryPlanSummaryResponse create() => QueryPlanSummaryResponse._();
  QueryPlanSummaryResponse createEmptyInstance() => create();
  static $pb.PbList<QueryPlanSummaryResponse> createRepeated() => $pb.PbList<QueryPlanSummaryResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryPlanSummaryResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryPlanSummaryResponse>(create);
  static QueryPlanSummaryResponse _defaultInstance;

  @$pb.TagNumber(1)
  $1.PlanSummary get planSummary => $_getN(0);
  @$pb.TagNumber(1)
  set planSummary($1.PlanSummary v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlanSummary() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlanSummary() => clearField(1);
  @$pb.TagNumber(1)
  $1.PlanSummary ensurePlanSummary() => $_ensure(0);
}

class QueryPlanSummaryRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryPlanSummaryRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  QueryPlanSummaryRequest._() : super();
  factory QueryPlanSummaryRequest() => create();
  factory QueryPlanSummaryRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryPlanSummaryRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryPlanSummaryRequest clone() => QueryPlanSummaryRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryPlanSummaryRequest copyWith(void Function(QueryPlanSummaryRequest) updates) => super.copyWith((message) => updates(message as QueryPlanSummaryRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryPlanSummaryRequest create() => QueryPlanSummaryRequest._();
  QueryPlanSummaryRequest createEmptyInstance() => create();
  static $pb.PbList<QueryPlanSummaryRequest> createRepeated() => $pb.PbList<QueryPlanSummaryRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryPlanSummaryRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryPlanSummaryRequest>(create);
  static QueryPlanSummaryRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class QueryActivePlanSummaryRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryActivePlanSummaryRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  QueryActivePlanSummaryRequest._() : super();
  factory QueryActivePlanSummaryRequest() => create();
  factory QueryActivePlanSummaryRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryActivePlanSummaryRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryActivePlanSummaryRequest clone() => QueryActivePlanSummaryRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryActivePlanSummaryRequest copyWith(void Function(QueryActivePlanSummaryRequest) updates) => super.copyWith((message) => updates(message as QueryActivePlanSummaryRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryActivePlanSummaryRequest create() => QueryActivePlanSummaryRequest._();
  QueryActivePlanSummaryRequest createEmptyInstance() => create();
  static $pb.PbList<QueryActivePlanSummaryRequest> createRepeated() => $pb.PbList<QueryActivePlanSummaryRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryActivePlanSummaryRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryActivePlanSummaryRequest>(create);
  static QueryActivePlanSummaryRequest _defaultInstance;
}

class QueryArchivedPlanResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryArchivedPlanResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..pc<$1.Plan>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'plans', $pb.PbFieldType.PM, subBuilder: $1.Plan.create)
    ..hasRequiredFields = false
  ;

  QueryArchivedPlanResponse._() : super();
  factory QueryArchivedPlanResponse() => create();
  factory QueryArchivedPlanResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryArchivedPlanResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryArchivedPlanResponse clone() => QueryArchivedPlanResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryArchivedPlanResponse copyWith(void Function(QueryArchivedPlanResponse) updates) => super.copyWith((message) => updates(message as QueryArchivedPlanResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryArchivedPlanResponse create() => QueryArchivedPlanResponse._();
  QueryArchivedPlanResponse createEmptyInstance() => create();
  static $pb.PbList<QueryArchivedPlanResponse> createRepeated() => $pb.PbList<QueryArchivedPlanResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryArchivedPlanResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryArchivedPlanResponse>(create);
  static QueryArchivedPlanResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.Plan> get plans => $_getList(0);
}

class QueryActivePlanSummaryResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryActivePlanSummaryResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..pc<$1.PlanSummary>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'plans', $pb.PbFieldType.PM, subBuilder: $1.PlanSummary.create)
    ..hasRequiredFields = false
  ;

  QueryActivePlanSummaryResponse._() : super();
  factory QueryActivePlanSummaryResponse() => create();
  factory QueryActivePlanSummaryResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryActivePlanSummaryResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryActivePlanSummaryResponse clone() => QueryActivePlanSummaryResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryActivePlanSummaryResponse copyWith(void Function(QueryActivePlanSummaryResponse) updates) => super.copyWith((message) => updates(message as QueryActivePlanSummaryResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryActivePlanSummaryResponse create() => QueryActivePlanSummaryResponse._();
  QueryActivePlanSummaryResponse createEmptyInstance() => create();
  static $pb.PbList<QueryActivePlanSummaryResponse> createRepeated() => $pb.PbList<QueryActivePlanSummaryResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryActivePlanSummaryResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryActivePlanSummaryResponse>(create);
  static QueryActivePlanSummaryResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.PlanSummary> get plans => $_getList(0);
}

class UpdatePlanCompletedIndexRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdatePlanCompletedIndexRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'planId', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  UpdatePlanCompletedIndexRequest._() : super();
  factory UpdatePlanCompletedIndexRequest() => create();
  factory UpdatePlanCompletedIndexRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePlanCompletedIndexRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePlanCompletedIndexRequest clone() => UpdatePlanCompletedIndexRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePlanCompletedIndexRequest copyWith(void Function(UpdatePlanCompletedIndexRequest) updates) => super.copyWith((message) => updates(message as UpdatePlanCompletedIndexRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdatePlanCompletedIndexRequest create() => UpdatePlanCompletedIndexRequest._();
  UpdatePlanCompletedIndexRequest createEmptyInstance() => create();
  static $pb.PbList<UpdatePlanCompletedIndexRequest> createRepeated() => $pb.PbList<UpdatePlanCompletedIndexRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdatePlanCompletedIndexRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePlanCompletedIndexRequest>(create);
  static UpdatePlanCompletedIndexRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get planId => $_getIZ(0);
  @$pb.TagNumber(1)
  set planId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlanId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlanId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get value => $_getIZ(1);
  @$pb.TagNumber(2)
  set value($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
}

class UpdatePlanCompletedIndexResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdatePlanCompletedIndexResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  UpdatePlanCompletedIndexResponse._() : super();
  factory UpdatePlanCompletedIndexResponse() => create();
  factory UpdatePlanCompletedIndexResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePlanCompletedIndexResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePlanCompletedIndexResponse clone() => UpdatePlanCompletedIndexResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePlanCompletedIndexResponse copyWith(void Function(UpdatePlanCompletedIndexResponse) updates) => super.copyWith((message) => updates(message as UpdatePlanCompletedIndexResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdatePlanCompletedIndexResponse create() => UpdatePlanCompletedIndexResponse._();
  UpdatePlanCompletedIndexResponse createEmptyInstance() => create();
  static $pb.PbList<UpdatePlanCompletedIndexResponse> createRepeated() => $pb.PbList<UpdatePlanCompletedIndexResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdatePlanCompletedIndexResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePlanCompletedIndexResponse>(create);
  static UpdatePlanCompletedIndexResponse _defaultInstance;
}

class UpdatePlanArchiveStateResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdatePlanArchiveStateResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..aOM<$2.StringValue>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'planNewCode', subBuilder: $2.StringValue.create)
    ..hasRequiredFields = false
  ;

  UpdatePlanArchiveStateResponse._() : super();
  factory UpdatePlanArchiveStateResponse() => create();
  factory UpdatePlanArchiveStateResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePlanArchiveStateResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePlanArchiveStateResponse clone() => UpdatePlanArchiveStateResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePlanArchiveStateResponse copyWith(void Function(UpdatePlanArchiveStateResponse) updates) => super.copyWith((message) => updates(message as UpdatePlanArchiveStateResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdatePlanArchiveStateResponse create() => UpdatePlanArchiveStateResponse._();
  UpdatePlanArchiveStateResponse createEmptyInstance() => create();
  static $pb.PbList<UpdatePlanArchiveStateResponse> createRepeated() => $pb.PbList<UpdatePlanArchiveStateResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdatePlanArchiveStateResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePlanArchiveStateResponse>(create);
  static UpdatePlanArchiveStateResponse _defaultInstance;

  @$pb.TagNumber(1)
  $2.StringValue get planNewCode => $_getN(0);
  @$pb.TagNumber(1)
  set planNewCode($2.StringValue v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlanNewCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlanNewCode() => clearField(1);
  @$pb.TagNumber(1)
  $2.StringValue ensurePlanNewCode() => $_ensure(0);
}

class UpdatePlanArchiveStateRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdatePlanArchiveStateRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'planId', $pb.PbFieldType.O3)
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'archived')
    ..hasRequiredFields = false
  ;

  UpdatePlanArchiveStateRequest._() : super();
  factory UpdatePlanArchiveStateRequest() => create();
  factory UpdatePlanArchiveStateRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePlanArchiveStateRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePlanArchiveStateRequest clone() => UpdatePlanArchiveStateRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePlanArchiveStateRequest copyWith(void Function(UpdatePlanArchiveStateRequest) updates) => super.copyWith((message) => updates(message as UpdatePlanArchiveStateRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdatePlanArchiveStateRequest create() => UpdatePlanArchiveStateRequest._();
  UpdatePlanArchiveStateRequest createEmptyInstance() => create();
  static $pb.PbList<UpdatePlanArchiveStateRequest> createRepeated() => $pb.PbList<UpdatePlanArchiveStateRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdatePlanArchiveStateRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePlanArchiveStateRequest>(create);
  static UpdatePlanArchiveStateRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get planId => $_getIZ(0);
  @$pb.TagNumber(1)
  set planId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlanId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlanId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get archived => $_getBF(1);
  @$pb.TagNumber(2)
  set archived($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasArchived() => $_has(1);
  @$pb.TagNumber(2)
  void clearArchived() => clearField(2);
}

class DeletePlanRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeletePlanRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  DeletePlanRequest._() : super();
  factory DeletePlanRequest() => create();
  factory DeletePlanRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeletePlanRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeletePlanRequest clone() => DeletePlanRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeletePlanRequest copyWith(void Function(DeletePlanRequest) updates) => super.copyWith((message) => updates(message as DeletePlanRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeletePlanRequest create() => DeletePlanRequest._();
  DeletePlanRequest createEmptyInstance() => create();
  static $pb.PbList<DeletePlanRequest> createRepeated() => $pb.PbList<DeletePlanRequest>();
  @$core.pragma('dart2js:noInline')
  static DeletePlanRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeletePlanRequest>(create);
  static DeletePlanRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class DeletePlanResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeletePlanResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  DeletePlanResponse._() : super();
  factory DeletePlanResponse() => create();
  factory DeletePlanResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeletePlanResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeletePlanResponse clone() => DeletePlanResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeletePlanResponse copyWith(void Function(DeletePlanResponse) updates) => super.copyWith((message) => updates(message as DeletePlanResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeletePlanResponse create() => DeletePlanResponse._();
  DeletePlanResponse createEmptyInstance() => create();
  static $pb.PbList<DeletePlanResponse> createRepeated() => $pb.PbList<DeletePlanResponse>();
  @$core.pragma('dart2js:noInline')
  static DeletePlanResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeletePlanResponse>(create);
  static DeletePlanResponse _defaultInstance;
}

class CreatePlanRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreatePlanRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOM<$2.StringValue>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'note', subBuilder: $2.StringValue.create)
    ..e<$1.PlanType>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: $1.PlanType.UNKNOWN_TYPE, valueOf: $1.PlanType.valueOf, enumValues: $1.PlanType.values)
    ..aOM<$2.Int32Value>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalIndex', subBuilder: $2.Int32Value.create)
    ..aOM<$2.Int32Value>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'minIndex', subBuilder: $2.Int32Value.create)
    ..aOM<$3.Timestamp>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'startTime', subBuilder: $3.Timestamp.create)
    ..aOM<$3.Timestamp>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'endTime', subBuilder: $3.Timestamp.create)
    ..hasRequiredFields = false
  ;

  CreatePlanRequest._() : super();
  factory CreatePlanRequest() => create();
  factory CreatePlanRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePlanRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePlanRequest clone() => CreatePlanRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePlanRequest copyWith(void Function(CreatePlanRequest) updates) => super.copyWith((message) => updates(message as CreatePlanRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreatePlanRequest create() => CreatePlanRequest._();
  CreatePlanRequest createEmptyInstance() => create();
  static $pb.PbList<CreatePlanRequest> createRepeated() => $pb.PbList<CreatePlanRequest>();
  @$core.pragma('dart2js:noInline')
  static CreatePlanRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePlanRequest>(create);
  static CreatePlanRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $2.StringValue get note => $_getN(1);
  @$pb.TagNumber(2)
  set note($2.StringValue v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasNote() => $_has(1);
  @$pb.TagNumber(2)
  void clearNote() => clearField(2);
  @$pb.TagNumber(2)
  $2.StringValue ensureNote() => $_ensure(1);

  @$pb.TagNumber(3)
  $1.PlanType get type => $_getN(2);
  @$pb.TagNumber(3)
  set type($1.PlanType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);

  @$pb.TagNumber(4)
  $2.Int32Value get totalIndex => $_getN(3);
  @$pb.TagNumber(4)
  set totalIndex($2.Int32Value v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasTotalIndex() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalIndex() => clearField(4);
  @$pb.TagNumber(4)
  $2.Int32Value ensureTotalIndex() => $_ensure(3);

  @$pb.TagNumber(5)
  $2.Int32Value get minIndex => $_getN(4);
  @$pb.TagNumber(5)
  set minIndex($2.Int32Value v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasMinIndex() => $_has(4);
  @$pb.TagNumber(5)
  void clearMinIndex() => clearField(5);
  @$pb.TagNumber(5)
  $2.Int32Value ensureMinIndex() => $_ensure(4);

  @$pb.TagNumber(6)
  $3.Timestamp get startTime => $_getN(5);
  @$pb.TagNumber(6)
  set startTime($3.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasStartTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearStartTime() => clearField(6);
  @$pb.TagNumber(6)
  $3.Timestamp ensureStartTime() => $_ensure(5);

  @$pb.TagNumber(7)
  $3.Timestamp get endTime => $_getN(6);
  @$pb.TagNumber(7)
  set endTime($3.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasEndTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearEndTime() => clearField(7);
  @$pb.TagNumber(7)
  $3.Timestamp ensureEndTime() => $_ensure(6);
}

class UpdatePlanRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdatePlanRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'planId', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOM<$2.StringValue>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'note', subBuilder: $2.StringValue.create)
    ..aOM<$2.Int32Value>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalIndex', subBuilder: $2.Int32Value.create)
    ..aOM<$2.Int32Value>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'minIndex', subBuilder: $2.Int32Value.create)
    ..aOM<$3.Timestamp>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'startTime', subBuilder: $3.Timestamp.create)
    ..aOM<$3.Timestamp>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'endTime', subBuilder: $3.Timestamp.create)
    ..hasRequiredFields = false
  ;

  UpdatePlanRequest._() : super();
  factory UpdatePlanRequest() => create();
  factory UpdatePlanRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePlanRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePlanRequest clone() => UpdatePlanRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePlanRequest copyWith(void Function(UpdatePlanRequest) updates) => super.copyWith((message) => updates(message as UpdatePlanRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdatePlanRequest create() => UpdatePlanRequest._();
  UpdatePlanRequest createEmptyInstance() => create();
  static $pb.PbList<UpdatePlanRequest> createRepeated() => $pb.PbList<UpdatePlanRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdatePlanRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePlanRequest>(create);
  static UpdatePlanRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get planId => $_getIZ(0);
  @$pb.TagNumber(1)
  set planId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlanId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlanId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $2.StringValue get note => $_getN(2);
  @$pb.TagNumber(3)
  set note($2.StringValue v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasNote() => $_has(2);
  @$pb.TagNumber(3)
  void clearNote() => clearField(3);
  @$pb.TagNumber(3)
  $2.StringValue ensureNote() => $_ensure(2);

  @$pb.TagNumber(4)
  $2.Int32Value get totalIndex => $_getN(3);
  @$pb.TagNumber(4)
  set totalIndex($2.Int32Value v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasTotalIndex() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalIndex() => clearField(4);
  @$pb.TagNumber(4)
  $2.Int32Value ensureTotalIndex() => $_ensure(3);

  @$pb.TagNumber(5)
  $2.Int32Value get minIndex => $_getN(4);
  @$pb.TagNumber(5)
  set minIndex($2.Int32Value v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasMinIndex() => $_has(4);
  @$pb.TagNumber(5)
  void clearMinIndex() => clearField(5);
  @$pb.TagNumber(5)
  $2.Int32Value ensureMinIndex() => $_ensure(4);

  @$pb.TagNumber(6)
  $3.Timestamp get startTime => $_getN(5);
  @$pb.TagNumber(6)
  set startTime($3.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasStartTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearStartTime() => clearField(6);
  @$pb.TagNumber(6)
  $3.Timestamp ensureStartTime() => $_ensure(5);

  @$pb.TagNumber(7)
  $3.Timestamp get endTime => $_getN(6);
  @$pb.TagNumber(7)
  set endTime($3.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasEndTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearEndTime() => clearField(7);
  @$pb.TagNumber(7)
  $3.Timestamp ensureEndTime() => $_ensure(6);
}

class UpdatePlanResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdatePlanResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  UpdatePlanResponse._() : super();
  factory UpdatePlanResponse() => create();
  factory UpdatePlanResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePlanResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePlanResponse clone() => UpdatePlanResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePlanResponse copyWith(void Function(UpdatePlanResponse) updates) => super.copyWith((message) => updates(message as UpdatePlanResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdatePlanResponse create() => UpdatePlanResponse._();
  UpdatePlanResponse createEmptyInstance() => create();
  static $pb.PbList<UpdatePlanResponse> createRepeated() => $pb.PbList<UpdatePlanResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdatePlanResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePlanResponse>(create);
  static UpdatePlanResponse _defaultInstance;
}

class CreatePlanResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreatePlanResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code')
    ..hasRequiredFields = false
  ;

  CreatePlanResponse._() : super();
  factory CreatePlanResponse() => create();
  factory CreatePlanResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePlanResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePlanResponse clone() => CreatePlanResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePlanResponse copyWith(void Function(CreatePlanResponse) updates) => super.copyWith((message) => updates(message as CreatePlanResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreatePlanResponse create() => CreatePlanResponse._();
  CreatePlanResponse createEmptyInstance() => create();
  static $pb.PbList<CreatePlanResponse> createRepeated() => $pb.PbList<CreatePlanResponse>();
  @$core.pragma('dart2js:noInline')
  static CreatePlanResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePlanResponse>(create);
  static CreatePlanResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get code => $_getSZ(1);
  @$pb.TagNumber(2)
  set code($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);
}

