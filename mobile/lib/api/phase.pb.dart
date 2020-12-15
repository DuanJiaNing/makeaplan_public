///
//  Generated code. Do not modify.
//  source: phase.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $0;
import 'statistics.pb.dart' as $1;

import 'common.pbenum.dart' as $2;

export 'phase.pbenum.dart';

class Phase extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Phase', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'note')
    ..aOM<$0.Timestamp>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'startTime', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'endTime', subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false
  ;

  Phase._() : super();
  factory Phase() => create();
  factory Phase.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Phase.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Phase clone() => Phase()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Phase copyWith(void Function(Phase) updates) => super.copyWith((message) => updates(message as Phase)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Phase create() => Phase._();
  Phase createEmptyInstance() => create();
  static $pb.PbList<Phase> createRepeated() => $pb.PbList<Phase>();
  @$core.pragma('dart2js:noInline')
  static Phase getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Phase>(create);
  static Phase _defaultInstance;

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
  $core.String get note => $_getSZ(2);
  @$pb.TagNumber(3)
  set note($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNote() => $_has(2);
  @$pb.TagNumber(3)
  void clearNote() => clearField(3);

  @$pb.TagNumber(5)
  $0.Timestamp get startTime => $_getN(3);
  @$pb.TagNumber(5)
  set startTime($0.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasStartTime() => $_has(3);
  @$pb.TagNumber(5)
  void clearStartTime() => clearField(5);
  @$pb.TagNumber(5)
  $0.Timestamp ensureStartTime() => $_ensure(3);

  @$pb.TagNumber(6)
  $0.Timestamp get endTime => $_getN(4);
  @$pb.TagNumber(6)
  set endTime($0.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasEndTime() => $_has(4);
  @$pb.TagNumber(6)
  void clearEndTime() => clearField(6);
  @$pb.TagNumber(6)
  $0.Timestamp ensureEndTime() => $_ensure(4);
}

class PhaseSummary extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PhaseSummary', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..aOM<Phase>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'phase', subBuilder: Phase.create)
    ..e<$2.CommonStatus>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: $2.CommonStatus.UNKNOWN_COMMON_STATUS, valueOf: $2.CommonStatus.valueOf, enumValues: $2.CommonStatus.values)
    ..aOM<$1.Statistics>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'taskStatis', protoName: 'taskStatis', subBuilder: $1.Statistics.create)
    ..hasRequiredFields = false
  ;

  PhaseSummary._() : super();
  factory PhaseSummary() => create();
  factory PhaseSummary.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PhaseSummary.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PhaseSummary clone() => PhaseSummary()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PhaseSummary copyWith(void Function(PhaseSummary) updates) => super.copyWith((message) => updates(message as PhaseSummary)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PhaseSummary create() => PhaseSummary._();
  PhaseSummary createEmptyInstance() => create();
  static $pb.PbList<PhaseSummary> createRepeated() => $pb.PbList<PhaseSummary>();
  @$core.pragma('dart2js:noInline')
  static PhaseSummary getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PhaseSummary>(create);
  static PhaseSummary _defaultInstance;

  @$pb.TagNumber(1)
  Phase get phase => $_getN(0);
  @$pb.TagNumber(1)
  set phase(Phase v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPhase() => $_has(0);
  @$pb.TagNumber(1)
  void clearPhase() => clearField(1);
  @$pb.TagNumber(1)
  Phase ensurePhase() => $_ensure(0);

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
}

