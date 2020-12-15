///
//  Generated code. Do not modify.
//  source: plan.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class PlanType extends $pb.ProtobufEnum {
  static const PlanType UNKNOWN_TYPE = PlanType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_TYPE');
  static const PlanType TASK_LIST = PlanType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TASK_LIST');
  static const PlanType PHASED = PlanType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PHASED');

  static const $core.List<PlanType> values = <PlanType> [
    UNKNOWN_TYPE,
    TASK_LIST,
    PHASED,
  ];

  static final $core.Map<$core.int, PlanType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PlanType valueOf($core.int value) => _byValue[value];

  const PlanType._($core.int v, $core.String n) : super(v, n);
}

class PlanCompleteStatus extends $pb.ProtobufEnum {
  static const PlanCompleteStatus UNKNOWN_PLAN_COMPLETE_STATUS = PlanCompleteStatus._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_PLAN_COMPLETE_STATUS');
  static const PlanCompleteStatus PLAN_DONE = PlanCompleteStatus._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PLAN_DONE');
  static const PlanCompleteStatus PLAN_SUCCEED = PlanCompleteStatus._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PLAN_SUCCEED');
  static const PlanCompleteStatus PLAN_FAILED = PlanCompleteStatus._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PLAN_FAILED');

  static const $core.List<PlanCompleteStatus> values = <PlanCompleteStatus> [
    UNKNOWN_PLAN_COMPLETE_STATUS,
    PLAN_DONE,
    PLAN_SUCCEED,
    PLAN_FAILED,
  ];

  static final $core.Map<$core.int, PlanCompleteStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PlanCompleteStatus valueOf($core.int value) => _byValue[value];

  const PlanCompleteStatus._($core.int v, $core.String n) : super(v, n);
}

