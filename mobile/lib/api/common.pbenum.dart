///
//  Generated code. Do not modify.
//  source: common.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class CommonStatus extends $pb.ProtobufEnum {
  static const CommonStatus UNKNOWN_COMMON_STATUS = CommonStatus._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_COMMON_STATUS');
  static const CommonStatus NOT_STARTED_YET = CommonStatus._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NOT_STARTED_YET');
  static const CommonStatus IN_PROGRESS = CommonStatus._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'IN_PROGRESS');
  static const CommonStatus FINISHED = CommonStatus._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FINISHED');

  static const $core.List<CommonStatus> values = <CommonStatus> [
    UNKNOWN_COMMON_STATUS,
    NOT_STARTED_YET,
    IN_PROGRESS,
    FINISHED,
  ];

  static final $core.Map<$core.int, CommonStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CommonStatus valueOf($core.int value) => _byValue[value];

  const CommonStatus._($core.int v, $core.String n) : super(v, n);
}

