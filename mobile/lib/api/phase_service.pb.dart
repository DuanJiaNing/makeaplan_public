///
//  Generated code. Do not modify.
//  source: phase_service.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'phase.pb.dart' as $1;
import 'google/protobuf/wrappers.pb.dart' as $2;
import 'google/protobuf/timestamp.pb.dart' as $3;

class QueryPhaseSummaryRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryPhaseSummaryRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'phaseId', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'planId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  QueryPhaseSummaryRequest._() : super();
  factory QueryPhaseSummaryRequest() => create();
  factory QueryPhaseSummaryRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryPhaseSummaryRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryPhaseSummaryRequest clone() => QueryPhaseSummaryRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryPhaseSummaryRequest copyWith(void Function(QueryPhaseSummaryRequest) updates) => super.copyWith((message) => updates(message as QueryPhaseSummaryRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryPhaseSummaryRequest create() => QueryPhaseSummaryRequest._();
  QueryPhaseSummaryRequest createEmptyInstance() => create();
  static $pb.PbList<QueryPhaseSummaryRequest> createRepeated() => $pb.PbList<QueryPhaseSummaryRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryPhaseSummaryRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryPhaseSummaryRequest>(create);
  static QueryPhaseSummaryRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get phaseId => $_getIZ(0);
  @$pb.TagNumber(1)
  set phaseId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPhaseId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPhaseId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get planId => $_getIZ(1);
  @$pb.TagNumber(2)
  set planId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPlanId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPlanId() => clearField(2);
}

class QueryPhaseSummaryResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryPhaseSummaryResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..aOM<$1.PhaseSummary>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'phase', subBuilder: $1.PhaseSummary.create)
    ..hasRequiredFields = false
  ;

  QueryPhaseSummaryResponse._() : super();
  factory QueryPhaseSummaryResponse() => create();
  factory QueryPhaseSummaryResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryPhaseSummaryResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryPhaseSummaryResponse clone() => QueryPhaseSummaryResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryPhaseSummaryResponse copyWith(void Function(QueryPhaseSummaryResponse) updates) => super.copyWith((message) => updates(message as QueryPhaseSummaryResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryPhaseSummaryResponse create() => QueryPhaseSummaryResponse._();
  QueryPhaseSummaryResponse createEmptyInstance() => create();
  static $pb.PbList<QueryPhaseSummaryResponse> createRepeated() => $pb.PbList<QueryPhaseSummaryResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryPhaseSummaryResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryPhaseSummaryResponse>(create);
  static QueryPhaseSummaryResponse _defaultInstance;

  @$pb.TagNumber(1)
  $1.PhaseSummary get phase => $_getN(0);
  @$pb.TagNumber(1)
  set phase($1.PhaseSummary v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPhase() => $_has(0);
  @$pb.TagNumber(1)
  void clearPhase() => clearField(1);
  @$pb.TagNumber(1)
  $1.PhaseSummary ensurePhase() => $_ensure(0);
}

class QueryPlanPhaseSummaryRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryPlanPhaseSummaryRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'planId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  QueryPlanPhaseSummaryRequest._() : super();
  factory QueryPlanPhaseSummaryRequest() => create();
  factory QueryPlanPhaseSummaryRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryPlanPhaseSummaryRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryPlanPhaseSummaryRequest clone() => QueryPlanPhaseSummaryRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryPlanPhaseSummaryRequest copyWith(void Function(QueryPlanPhaseSummaryRequest) updates) => super.copyWith((message) => updates(message as QueryPlanPhaseSummaryRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryPlanPhaseSummaryRequest create() => QueryPlanPhaseSummaryRequest._();
  QueryPlanPhaseSummaryRequest createEmptyInstance() => create();
  static $pb.PbList<QueryPlanPhaseSummaryRequest> createRepeated() => $pb.PbList<QueryPlanPhaseSummaryRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryPlanPhaseSummaryRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryPlanPhaseSummaryRequest>(create);
  static QueryPlanPhaseSummaryRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get planId => $_getIZ(0);
  @$pb.TagNumber(1)
  set planId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlanId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlanId() => clearField(1);
}

class QueryPlanPhaseSummaryResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryPlanPhaseSummaryResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..pc<$1.PhaseSummary>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'phases', $pb.PbFieldType.PM, subBuilder: $1.PhaseSummary.create)
    ..hasRequiredFields = false
  ;

  QueryPlanPhaseSummaryResponse._() : super();
  factory QueryPlanPhaseSummaryResponse() => create();
  factory QueryPlanPhaseSummaryResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryPlanPhaseSummaryResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryPlanPhaseSummaryResponse clone() => QueryPlanPhaseSummaryResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryPlanPhaseSummaryResponse copyWith(void Function(QueryPlanPhaseSummaryResponse) updates) => super.copyWith((message) => updates(message as QueryPlanPhaseSummaryResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryPlanPhaseSummaryResponse create() => QueryPlanPhaseSummaryResponse._();
  QueryPlanPhaseSummaryResponse createEmptyInstance() => create();
  static $pb.PbList<QueryPlanPhaseSummaryResponse> createRepeated() => $pb.PbList<QueryPlanPhaseSummaryResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryPlanPhaseSummaryResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryPlanPhaseSummaryResponse>(create);
  static QueryPlanPhaseSummaryResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.PhaseSummary> get phases => $_getList(0);
}

class UpdatePhaseRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdatePhaseRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'phaseId', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOM<$2.StringValue>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'note', subBuilder: $2.StringValue.create)
    ..aOM<$3.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'startTime', subBuilder: $3.Timestamp.create)
    ..aOM<$3.Timestamp>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'endTime', subBuilder: $3.Timestamp.create)
    ..hasRequiredFields = false
  ;

  UpdatePhaseRequest._() : super();
  factory UpdatePhaseRequest() => create();
  factory UpdatePhaseRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePhaseRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePhaseRequest clone() => UpdatePhaseRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePhaseRequest copyWith(void Function(UpdatePhaseRequest) updates) => super.copyWith((message) => updates(message as UpdatePhaseRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdatePhaseRequest create() => UpdatePhaseRequest._();
  UpdatePhaseRequest createEmptyInstance() => create();
  static $pb.PbList<UpdatePhaseRequest> createRepeated() => $pb.PbList<UpdatePhaseRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdatePhaseRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePhaseRequest>(create);
  static UpdatePhaseRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get phaseId => $_getIZ(0);
  @$pb.TagNumber(1)
  set phaseId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPhaseId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPhaseId() => clearField(1);

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
  $3.Timestamp get startTime => $_getN(3);
  @$pb.TagNumber(4)
  set startTime($3.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasStartTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearStartTime() => clearField(4);
  @$pb.TagNumber(4)
  $3.Timestamp ensureStartTime() => $_ensure(3);

  @$pb.TagNumber(5)
  $3.Timestamp get endTime => $_getN(4);
  @$pb.TagNumber(5)
  set endTime($3.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasEndTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearEndTime() => clearField(5);
  @$pb.TagNumber(5)
  $3.Timestamp ensureEndTime() => $_ensure(4);
}

class UpdatePhaseResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdatePhaseResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  UpdatePhaseResponse._() : super();
  factory UpdatePhaseResponse() => create();
  factory UpdatePhaseResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePhaseResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePhaseResponse clone() => UpdatePhaseResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePhaseResponse copyWith(void Function(UpdatePhaseResponse) updates) => super.copyWith((message) => updates(message as UpdatePhaseResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdatePhaseResponse create() => UpdatePhaseResponse._();
  UpdatePhaseResponse createEmptyInstance() => create();
  static $pb.PbList<UpdatePhaseResponse> createRepeated() => $pb.PbList<UpdatePhaseResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdatePhaseResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePhaseResponse>(create);
  static UpdatePhaseResponse _defaultInstance;
}

class DeletePhaseRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeletePhaseRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'phaseId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  DeletePhaseRequest._() : super();
  factory DeletePhaseRequest() => create();
  factory DeletePhaseRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeletePhaseRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeletePhaseRequest clone() => DeletePhaseRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeletePhaseRequest copyWith(void Function(DeletePhaseRequest) updates) => super.copyWith((message) => updates(message as DeletePhaseRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeletePhaseRequest create() => DeletePhaseRequest._();
  DeletePhaseRequest createEmptyInstance() => create();
  static $pb.PbList<DeletePhaseRequest> createRepeated() => $pb.PbList<DeletePhaseRequest>();
  @$core.pragma('dart2js:noInline')
  static DeletePhaseRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeletePhaseRequest>(create);
  static DeletePhaseRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get phaseId => $_getIZ(0);
  @$pb.TagNumber(1)
  set phaseId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPhaseId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPhaseId() => clearField(1);
}

class DeletePhaseResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeletePhaseResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  DeletePhaseResponse._() : super();
  factory DeletePhaseResponse() => create();
  factory DeletePhaseResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeletePhaseResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeletePhaseResponse clone() => DeletePhaseResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeletePhaseResponse copyWith(void Function(DeletePhaseResponse) updates) => super.copyWith((message) => updates(message as DeletePhaseResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeletePhaseResponse create() => DeletePhaseResponse._();
  DeletePhaseResponse createEmptyInstance() => create();
  static $pb.PbList<DeletePhaseResponse> createRepeated() => $pb.PbList<DeletePhaseResponse>();
  @$core.pragma('dart2js:noInline')
  static DeletePhaseResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeletePhaseResponse>(create);
  static DeletePhaseResponse _defaultInstance;
}

class CreatePhaseRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreatePhaseRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'planId', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOM<$2.StringValue>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'note', subBuilder: $2.StringValue.create)
    ..aOM<$3.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'startTime', subBuilder: $3.Timestamp.create)
    ..aOM<$3.Timestamp>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'endTime', subBuilder: $3.Timestamp.create)
    ..hasRequiredFields = false
  ;

  CreatePhaseRequest._() : super();
  factory CreatePhaseRequest() => create();
  factory CreatePhaseRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePhaseRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePhaseRequest clone() => CreatePhaseRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePhaseRequest copyWith(void Function(CreatePhaseRequest) updates) => super.copyWith((message) => updates(message as CreatePhaseRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreatePhaseRequest create() => CreatePhaseRequest._();
  CreatePhaseRequest createEmptyInstance() => create();
  static $pb.PbList<CreatePhaseRequest> createRepeated() => $pb.PbList<CreatePhaseRequest>();
  @$core.pragma('dart2js:noInline')
  static CreatePhaseRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePhaseRequest>(create);
  static CreatePhaseRequest _defaultInstance;

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
  $3.Timestamp get startTime => $_getN(3);
  @$pb.TagNumber(4)
  set startTime($3.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasStartTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearStartTime() => clearField(4);
  @$pb.TagNumber(4)
  $3.Timestamp ensureStartTime() => $_ensure(3);

  @$pb.TagNumber(5)
  $3.Timestamp get endTime => $_getN(4);
  @$pb.TagNumber(5)
  set endTime($3.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasEndTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearEndTime() => clearField(5);
  @$pb.TagNumber(5)
  $3.Timestamp ensureEndTime() => $_ensure(4);
}

class CreatePhaseResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreatePhaseResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'phaseId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  CreatePhaseResponse._() : super();
  factory CreatePhaseResponse() => create();
  factory CreatePhaseResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePhaseResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePhaseResponse clone() => CreatePhaseResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePhaseResponse copyWith(void Function(CreatePhaseResponse) updates) => super.copyWith((message) => updates(message as CreatePhaseResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreatePhaseResponse create() => CreatePhaseResponse._();
  CreatePhaseResponse createEmptyInstance() => create();
  static $pb.PbList<CreatePhaseResponse> createRepeated() => $pb.PbList<CreatePhaseResponse>();
  @$core.pragma('dart2js:noInline')
  static CreatePhaseResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePhaseResponse>(create);
  static CreatePhaseResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get phaseId => $_getIZ(0);
  @$pb.TagNumber(1)
  set phaseId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPhaseId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPhaseId() => clearField(1);
}

