import 'package:makeaplan/api/blog.pb.dart' as pb;
import 'package:makeaplan/api/blog_service.pb.dart' as pb;
import 'package:makeaplan/api/blog_service.pbgrpc.dart' as grpc;

import 'grpc_client.dart';

class BlogService {
  static BlogService _singleton;

  BlogService._internal();

  factory BlogService() {
    if (_singleton == null) {
      _singleton = BlogService._internal();
    }
    return _singleton;
  }

  grpc.BlogQueryClient _client() {
    return grpc.BlogQueryClient(
      GRPCClient().client(),
      options: getCommonCallOptions(),
    );
  }

  Future<List<pb.Blog>> queryAllBlog() async {
    print("BlogService.queryAllBlog");
    final v = await _client().queryAllBlog(pb.QueryAllBlogRequest.create());
    return v.blogs;
  }
}
