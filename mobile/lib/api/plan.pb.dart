///
//  Generated code. Do not modify.
//  source: plan.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $0;
import 'statistics.pb.dart' as $1;

import 'plan.pbenum.dart';
import 'common.pbenum.dart' as $2;

export 'plan.pbenum.dart';

class Plan extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Plan', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'note')
    ..e<PlanType>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: PlanType.UNKNOWN_TYPE, valueOf: PlanType.valueOf, enumValues: PlanType.values)
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalIndex', $pb.PbFieldType.O3)
    ..a<$core.int>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'minIndex', $pb.PbFieldType.O3)
    ..a<$core.int>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'completedIndex', $pb.PbFieldType.O3)
    ..aOM<$0.Timestamp>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'startTime', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'endTime', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateTime', subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false
  ;

  Plan._() : super();
  factory Plan() => create();
  factory Plan.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Plan.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Plan clone() => Plan()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Plan copyWith(void Function(Plan) updates) => super.copyWith((message) => updates(message as Plan)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Plan create() => Plan._();
  Plan createEmptyInstance() => create();
  static $pb.PbList<Plan> createRepeated() => $pb.PbList<Plan>();
  @$core.pragma('dart2js:noInline')
  static Plan getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Plan>(create);
  static Plan _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get code => $_getSZ(2);
  @$pb.TagNumber(3)
  set code($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearCode() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get note => $_getSZ(3);
  @$pb.TagNumber(4)
  set note($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNote() => $_has(3);
  @$pb.TagNumber(4)
  void clearNote() => clearField(4);

  @$pb.TagNumber(5)
  PlanType get type => $_getN(4);
  @$pb.TagNumber(5)
  set type(PlanType v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasType() => $_has(4);
  @$pb.TagNumber(5)
  void clearType() => clearField(5);

  @$pb.TagNumber(7)
  $core.int get totalIndex => $_getIZ(5);
  @$pb.TagNumber(7)
  set totalIndex($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(7)
  $core.bool hasTotalIndex() => $_has(5);
  @$pb.TagNumber(7)
  void clearTotalIndex() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get minIndex => $_getIZ(6);
  @$pb.TagNumber(8)
  set minIndex($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(8)
  $core.bool hasMinIndex() => $_has(6);
  @$pb.TagNumber(8)
  void clearMinIndex() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get completedIndex => $_getIZ(7);
  @$pb.TagNumber(9)
  set completedIndex($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(9)
  $core.bool hasCompletedIndex() => $_has(7);
  @$pb.TagNumber(9)
  void clearCompletedIndex() => clearField(9);

  @$pb.TagNumber(10)
  $0.Timestamp get startTime => $_getN(8);
  @$pb.TagNumber(10)
  set startTime($0.Timestamp v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasStartTime() => $_has(8);
  @$pb.TagNumber(10)
  void clearStartTime() => clearField(10);
  @$pb.TagNumber(10)
  $0.Timestamp ensureStartTime() => $_ensure(8);

  @$pb.TagNumber(11)
  $0.Timestamp get endTime => $_getN(9);
  @$pb.TagNumber(11)
  set endTime($0.Timestamp v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasEndTime() => $_has(9);
  @$pb.TagNumber(11)
  void clearEndTime() => clearField(11);
  @$pb.TagNumber(11)
  $0.Timestamp ensureEndTime() => $_ensure(9);

  @$pb.TagNumber(12)
  $0.Timestamp get updateTime => $_getN(10);
  @$pb.TagNumber(12)
  set updateTime($0.Timestamp v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasUpdateTime() => $_has(10);
  @$pb.TagNumber(12)
  void clearUpdateTime() => clearField(12);
  @$pb.TagNumber(12)
  $0.Timestamp ensureUpdateTime() => $_ensure(10);
}

class PlanSummary extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PlanSummary', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..aOM<Plan>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'plan', subBuilder: Plan.create)
    ..e<$2.CommonStatus>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: $2.CommonStatus.UNKNOWN_COMMON_STATUS, valueOf: $2.CommonStatus.valueOf, enumValues: $2.CommonStatus.values)
    ..aOM<$1.Statistics>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'taskStatis', protoName: 'taskStatis', subBuilder: $1.Statistics.create)
    ..aOM<$1.Statistics>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'phaseStatis', protoName: 'phaseStatis', subBuilder: $1.Statistics.create)
    ..hasRequiredFields = false
  ;

  PlanSummary._() : super();
  factory PlanSummary() => create();
  factory PlanSummary.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PlanSummary.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PlanSummary clone() => PlanSummary()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PlanSummary copyWith(void Function(PlanSummary) updates) => super.copyWith((message) => updates(message as PlanSummary)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PlanSummary create() => PlanSummary._();
  PlanSummary createEmptyInstance() => create();
  static $pb.PbList<PlanSummary> createRepeated() => $pb.PbList<PlanSummary>();
  @$core.pragma('dart2js:noInline')
  static PlanSummary getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PlanSummary>(create);
  static PlanSummary _defaultInstance;

  @$pb.TagNumber(1)
  Plan get plan => $_getN(0);
  @$pb.TagNumber(1)
  set plan(Plan v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlan() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlan() => clearField(1);
  @$pb.TagNumber(1)
  Plan ensurePlan() => $_ensure(0);

  @$pb.TagNumber(2)
  $2.CommonStatus get status => $_getN(1);
  @$pb.TagNumber(2)
  set status($2.CommonStatus v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);

  @$pb.TagNumber(3)
  $1.Statistics get taskStatis => $_getN(2);
  @$pb.TagNumber(3)
  set taskStatis($1.Statistics v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasTaskStatis() => $_has(2);
  @$pb.TagNumber(3)
  void clearTaskStatis() => clearField(3);
  @$pb.TagNumber(3)
  $1.Statistics ensureTaskStatis() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.Statistics get phaseStatis => $_getN(3);
  @$pb.TagNumber(4)
  set phaseStatis($1.Statistics v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPhaseStatis() => $_has(3);
  @$pb.TagNumber(4)
  void clearPhaseStatis() => clearField(4);
  @$pb.TagNumber(4)
  $1.Statistics ensurePhaseStatis() => $_ensure(3);
}

