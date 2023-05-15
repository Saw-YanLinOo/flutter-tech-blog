import 'package:techblog/core/remote/remote_constant.dart';
import 'package:techblog/core/remote/tech_blog_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:techblog/domain/models/blog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:techblog/domain/models/user_model.dart';

class FirebaseApiImpl extends TechBlogApi {
  FirebaseApiImpl._();
  static final FirebaseApiImpl _singleton = FirebaseApiImpl._();
  factory FirebaseApiImpl() => _singleton;

  var fireStore = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;

  @override
  Future<List<Blog>> getAllBlog() {
    return fireStore.collection(blogCollection).get().then((snapshot) {
      return snapshot.docs.map<Blog>((querySnapshot) {
        return Blog.fromJson(querySnapshot.data());
      }).toList();
    });
  }

  @override
  Future<User?> loginWithEmailPassword(String email, String password) async {
    return auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((credential) {
      return credential.user
        ?..updateEmail(email)
        ..updatePassword(password);
    });
  }

  @override
  Future<User?> registerWithEmailPassword(UserModel newUser) {
    return auth
        .createUserWithEmailAndPassword(
      email: newUser.email ?? "",
      password: newUser.password ?? "",
    )
        .then((credential) async {
      return credential.user
        ?..updateEmail(newUser.email ?? "")
        ..updatePassword(newUser.password ?? "");
    }).then((user) async {
      newUser.id = user?.uid;
      await addNewUser(newUser);
      return user;
    });
  }

  Future addNewUser(UserModel user) {
    return fireStore
        .collection(userCollection)
        .doc("${user.id}")
        .set(user.toJson());
  }

  @override
  UserModel getLoggedInUser() {
    return UserModel(
      id: auth.currentUser?.uid,
      name: auth.currentUser?.displayName,
      email: auth.currentUser?.email,
      phone: auth.currentUser?.phoneNumber,
      avatorUrl: auth.currentUser?.photoURL,
    );
  }

  @override
  bool isLoggedIn() {
    return auth.currentUser?.uid != null;
  }

  @override
  Future logOut() {
    return auth.signOut();
  }
}
