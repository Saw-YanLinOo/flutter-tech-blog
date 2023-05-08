import 'package:techblog/domain/models/blog.dart';

abstract class TechBlogApi {
  Future<List<Blog>> getAllBlog();
}
