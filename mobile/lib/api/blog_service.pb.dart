///
//  Generated code. Do not modify.
//  source: blog_service.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'blog.pb.dart' as $1;

class QueryAllBlogRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryAllBlogRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  QueryAllBlogRequest._() : super();
  factory QueryAllBlogRequest() => create();
  factory QueryAllBlogRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryAllBlogRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryAllBlogRequest clone() => QueryAllBlogRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryAllBlogRequest copyWith(void Function(QueryAllBlogRequest) updates) => super.copyWith((message) => updates(message as QueryAllBlogRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryAllBlogRequest create() => QueryAllBlogRequest._();
  QueryAllBlogRequest createEmptyInstance() => create();
  static $pb.PbList<QueryAllBlogRequest> createRepeated() => $pb.PbList<QueryAllBlogRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryAllBlogRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryAllBlogRequest>(create);
  static QueryAllBlogRequest _defaultInstance;
}

class QueryAllBlogReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryAllBlogReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..pc<$1.Blog>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'blogs', $pb.PbFieldType.PM, subBuilder: $1.Blog.create)
    ..hasRequiredFields = false
  ;

  QueryAllBlogReply._() : super();
  factory QueryAllBlogReply() => create();
  factory QueryAllBlogReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryAllBlogReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryAllBlogReply clone() => QueryAllBlogReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryAllBlogReply copyWith(void Function(QueryAllBlogReply) updates) => super.copyWith((message) => updates(message as QueryAllBlogReply)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryAllBlogReply create() => QueryAllBlogReply._();
  QueryAllBlogReply createEmptyInstance() => create();
  static $pb.PbList<QueryAllBlogReply> createRepeated() => $pb.PbList<QueryAllBlogReply>();
  @$core.pragma('dart2js:noInline')
  static QueryAllBlogReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryAllBlogReply>(create);
  static QueryAllBlogReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.Blog> get blogs => $_getList(0);
}

