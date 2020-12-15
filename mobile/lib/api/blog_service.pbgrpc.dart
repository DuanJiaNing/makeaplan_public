///
//  Generated code. Do not modify.
//  source: blog_service.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'blog_service.pb.dart' as $0;
export 'blog_service.pb.dart';

class BlogQueryClient extends $grpc.Client {
  static final _$queryAllBlog =
      $grpc.ClientMethod<$0.QueryAllBlogRequest, $0.QueryAllBlogReply>(
          '/service.BlogQuery/QueryAllBlog',
          ($0.QueryAllBlogRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.QueryAllBlogReply.fromBuffer(value));

  BlogQueryClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options,
      $core.Iterable<$grpc.ClientInterceptor> interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.QueryAllBlogReply> queryAllBlog(
      $0.QueryAllBlogRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$queryAllBlog, request, options: options);
  }
}

abstract class BlogQueryServiceBase extends $grpc.Service {
  $core.String get $name => 'service.BlogQuery';

  BlogQueryServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.QueryAllBlogRequest, $0.QueryAllBlogReply>(
            'QueryAllBlog',
            queryAllBlog_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.QueryAllBlogRequest.fromBuffer(value),
            ($0.QueryAllBlogReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.QueryAllBlogReply> queryAllBlog_Pre($grpc.ServiceCall call,
      $async.Future<$0.QueryAllBlogRequest> request) async {
    return queryAllBlog(call, await request);
  }

  $async.Future<$0.QueryAllBlogReply> queryAllBlog(
      $grpc.ServiceCall call, $0.QueryAllBlogRequest request);
}
