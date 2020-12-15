///
//  Generated code. Do not modify.
//  source: wrappers.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'package:protobuf/src/protobuf/mixins/well_known.dart' as $mixin;

class DoubleValue extends $pb.GeneratedMessage with $mixin.DoubleValueMixin {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DoubleValue', package: const $pb.PackageName('google.protobuf'), createEmptyInstance: create, toProto3Json: $mixin.DoubleValueMixin.toProto3JsonHelper, fromProto3Json: $mixin.DoubleValueMixin.fromProto3JsonHelper)
    ..a<$core.double>(1, 'value', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  DoubleValue._() : super();
  factory DoubleValue() => create();
  factory DoubleValue.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DoubleValue.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DoubleValue clone() => DoubleValue()..mergeFromMessage(this);
  DoubleValue copyWith(void Function(DoubleValue) updates) => super.copyWith((message) => updates(message as DoubleValue));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DoubleValue create() => DoubleValue._();
  DoubleValue createEmptyInstance() => create();
  static $pb.PbList<DoubleValue> createRepeated() => $pb.PbList<DoubleValue>();
  @$core.pragma('dart2js:noInline')
  static DoubleValue getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DoubleValue>(create);
  static DoubleValue _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get value => $_getN(0);
  @$pb.TagNumber(1)
  set value($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class FloatValue extends $pb.GeneratedMessage with $mixin.FloatValueMixin {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FloatValue', package: const $pb.PackageName('google.protobuf'), createEmptyInstance: create, toProto3Json: $mixin.FloatValueMixin.toProto3JsonHelper, fromProto3Json: $mixin.FloatValueMixin.fromProto3JsonHelper)
    ..a<$core.double>(1, 'value', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  FloatValue._() : super();
  factory FloatValue() => create();
  factory FloatValue.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FloatValue.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FloatValue clone() => FloatValue()..mergeFromMessage(this);
  FloatValue copyWith(void Function(FloatValue) updates) => super.copyWith((message) => updates(message as FloatValue));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FloatValue create() => FloatValue._();
  FloatValue createEmptyInstance() => create();
  static $pb.PbList<FloatValue> createRepeated() => $pb.PbList<FloatValue>();
  @$core.pragma('dart2js:noInline')
  static FloatValue getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FloatValue>(create);
  static FloatValue _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get value => $_getN(0);
  @$pb.TagNumber(1)
  set value($core.double v) { $_setFloat(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class Int64Value extends $pb.GeneratedMessage with $mixin.Int64ValueMixin {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Int64Value', package: const $pb.PackageName('google.protobuf'), createEmptyInstance: create, toProto3Json: $mixin.Int64ValueMixin.toProto3JsonHelper, fromProto3Json: $mixin.Int64ValueMixin.fromProto3JsonHelper)
    ..aInt64(1, 'value')
    ..hasRequiredFields = false
  ;

  Int64Value._() : super();
  factory Int64Value() => create();
  factory Int64Value.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Int64Value.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Int64Value clone() => Int64Value()..mergeFromMessage(this);
  Int64Value copyWith(void Function(Int64Value) updates) => super.copyWith((message) => updates(message as Int64Value));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Int64Value create() => Int64Value._();
  Int64Value createEmptyInstance() => create();
  static $pb.PbList<Int64Value> createRepeated() => $pb.PbList<Int64Value>();
  @$core.pragma('dart2js:noInline')
  static Int64Value getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Int64Value>(create);
  static Int64Value _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get value => $_getI64(0);
  @$pb.TagNumber(1)
  set value($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class UInt64Value extends $pb.GeneratedMessage with $mixin.UInt64ValueMixin {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UInt64Value', package: const $pb.PackageName('google.protobuf'), createEmptyInstance: create, toProto3Json: $mixin.UInt64ValueMixin.toProto3JsonHelper, fromProto3Json: $mixin.UInt64ValueMixin.fromProto3JsonHelper)
    ..a<$fixnum.Int64>(1, 'value', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  UInt64Value._() : super();
  factory UInt64Value() => create();
  factory UInt64Value.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UInt64Value.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UInt64Value clone() => UInt64Value()..mergeFromMessage(this);
  UInt64Value copyWith(void Function(UInt64Value) updates) => super.copyWith((message) => updates(message as UInt64Value));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UInt64Value create() => UInt64Value._();
  UInt64Value createEmptyInstance() => create();
  static $pb.PbList<UInt64Value> createRepeated() => $pb.PbList<UInt64Value>();
  @$core.pragma('dart2js:noInline')
  static UInt64Value getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UInt64Value>(create);
  static UInt64Value _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get value => $_getI64(0);
  @$pb.TagNumber(1)
  set value($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class Int32Value extends $pb.GeneratedMessage with $mixin.Int32ValueMixin {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Int32Value', package: const $pb.PackageName('google.protobuf'), createEmptyInstance: create, toProto3Json: $mixin.Int32ValueMixin.toProto3JsonHelper, fromProto3Json: $mixin.Int32ValueMixin.fromProto3JsonHelper)
    ..a<$core.int>(1, 'value', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  Int32Value._() : super();
  factory Int32Value() => create();
  factory Int32Value.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Int32Value.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Int32Value clone() => Int32Value()..mergeFromMessage(this);
  Int32Value copyWith(void Function(Int32Value) updates) => super.copyWith((message) => updates(message as Int32Value));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Int32Value create() => Int32Value._();
  Int32Value createEmptyInstance() => create();
  static $pb.PbList<Int32Value> createRepeated() => $pb.PbList<Int32Value>();
  @$core.pragma('dart2js:noInline')
  static Int32Value getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Int32Value>(create);
  static Int32Value _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get value => $_getIZ(0);
  @$pb.TagNumber(1)
  set value($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class UInt32Value extends $pb.GeneratedMessage with $mixin.UInt32ValueMixin {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UInt32Value', package: const $pb.PackageName('google.protobuf'), createEmptyInstance: create, toProto3Json: $mixin.UInt32ValueMixin.toProto3JsonHelper, fromProto3Json: $mixin.UInt32ValueMixin.fromProto3JsonHelper)
    ..a<$core.int>(1, 'value', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  UInt32Value._() : super();
  factory UInt32Value() => create();
  factory UInt32Value.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UInt32Value.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UInt32Value clone() => UInt32Value()..mergeFromMessage(this);
  UInt32Value copyWith(void Function(UInt32Value) updates) => super.copyWith((message) => updates(message as UInt32Value));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UInt32Value create() => UInt32Value._();
  UInt32Value createEmptyInstance() => create();
  static $pb.PbList<UInt32Value> createRepeated() => $pb.PbList<UInt32Value>();
  @$core.pragma('dart2js:noInline')
  static UInt32Value getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UInt32Value>(create);
  static UInt32Value _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get value => $_getIZ(0);
  @$pb.TagNumber(1)
  set value($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class BoolValue extends $pb.GeneratedMessage with $mixin.BoolValueMixin {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('BoolValue', package: const $pb.PackageName('google.protobuf'), createEmptyInstance: create, toProto3Json: $mixin.BoolValueMixin.toProto3JsonHelper, fromProto3Json: $mixin.BoolValueMixin.fromProto3JsonHelper)
    ..aOB(1, 'value')
    ..hasRequiredFields = false
  ;

  BoolValue._() : super();
  factory BoolValue() => create();
  factory BoolValue.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BoolValue.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  BoolValue clone() => BoolValue()..mergeFromMessage(this);
  BoolValue copyWith(void Function(BoolValue) updates) => super.copyWith((message) => updates(message as BoolValue));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BoolValue create() => BoolValue._();
  BoolValue createEmptyInstance() => create();
  static $pb.PbList<BoolValue> createRepeated() => $pb.PbList<BoolValue>();
  @$core.pragma('dart2js:noInline')
  static BoolValue getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BoolValue>(create);
  static BoolValue _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get value => $_getBF(0);
  @$pb.TagNumber(1)
  set value($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class StringValue extends $pb.GeneratedMessage with $mixin.StringValueMixin {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('StringValue', package: const $pb.PackageName('google.protobuf'), createEmptyInstance: create, toProto3Json: $mixin.StringValueMixin.toProto3JsonHelper, fromProto3Json: $mixin.StringValueMixin.fromProto3JsonHelper)
    ..aOS(1, 'value')
    ..hasRequiredFields = false
  ;

  StringValue._() : super();
  factory StringValue() => create();
  factory StringValue.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StringValue.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  StringValue clone() => StringValue()..mergeFromMessage(this);
  StringValue copyWith(void Function(StringValue) updates) => super.copyWith((message) => updates(message as StringValue));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StringValue create() => StringValue._();
  StringValue createEmptyInstance() => create();
  static $pb.PbList<StringValue> createRepeated() => $pb.PbList<StringValue>();
  @$core.pragma('dart2js:noInline')
  static StringValue getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StringValue>(create);
  static StringValue _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get value => $_getSZ(0);
  @$pb.TagNumber(1)
  set value($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class BytesValue extends $pb.GeneratedMessage with $mixin.BytesValueMixin {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('BytesValue', package: const $pb.PackageName('google.protobuf'), createEmptyInstance: create, toProto3Json: $mixin.BytesValueMixin.toProto3JsonHelper, fromProto3Json: $mixin.BytesValueMixin.fromProto3JsonHelper)
    ..a<$core.List<$core.int>>(1, 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  BytesValue._() : super();
  factory BytesValue() => create();
  factory BytesValue.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BytesValue.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  BytesValue clone() => BytesValue()..mergeFromMessage(this);
  BytesValue copyWith(void Function(BytesValue) updates) => super.copyWith((message) => updates(message as BytesValue));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BytesValue create() => BytesValue._();
  BytesValue createEmptyInstance() => create();
  static $pb.PbList<BytesValue> createRepeated() => $pb.PbList<BytesValue>();
  @$core.pragma('dart2js:noInline')
  static BytesValue getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BytesValue>(create);
  static BytesValue _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get value => $_getN(0);
  @$pb.TagNumber(1)
  set value($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

