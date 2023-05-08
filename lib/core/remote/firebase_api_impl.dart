import 'package:techblog/core/remote/remote_constant.dart';
import 'package:techblog/core/remote/tech_blog_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:techblog/domain/models/blog.dart';

class FirebaseApiImpl extends TechBlogApi {
  FirebaseApiImpl._();
  static final FirebaseApiImpl _singleton = FirebaseApiImpl._();
  factory FirebaseApiImpl() => _singleton;

  var fireStore = FirebaseFirestore.instance;

  @override
  Future<List<Blog>> getAllBlog() {
    return fireStore.collection(blogCollection).get().then((snapshot) {
      return snapshot.docs.map<Blog>((querySnapshot) {
        return Blog.fromJson(querySnapshot.data());
      }).toList();
    });
  }
}
