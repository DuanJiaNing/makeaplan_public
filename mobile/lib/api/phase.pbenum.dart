///
//  Generated code. Do not modify.
//  source: phase.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class PhaseCompleteStatus extends $pb.ProtobufEnum {
  static const PhaseCompleteStatus UNKNOWN_PHASE_COMPLETE_STATUS = PhaseCompleteStatus._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_PHASE_COMPLETE_STATUS');
  static const PhaseCompleteStatus PHASE_DONE = PhaseCompleteStatus._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PHASE_DONE');

  static const $core.List<PhaseCompleteStatus> values = <PhaseCompleteStatus> [
    UNKNOWN_PHASE_COMPLETE_STATUS,
    PHASE_DONE,
  ];

  static final $core.Map<$core.int, PhaseCompleteStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PhaseCompleteStatus valueOf($core.int value) => _byValue[value];

  const PhaseCompleteStatus._($core.int v, $core.String n) : super(v, n);
}

