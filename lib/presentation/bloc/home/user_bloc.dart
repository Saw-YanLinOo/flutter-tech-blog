import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techblog/domain/models/user_model.dart';
import 'package:techblog/domain/repository/tech_blog_repository_impl.dart';

class UserBloc extends Cubit<UserModel?> {
  UserBloc() : super(null);

  final TechBlogRepositoryImpl repo = TechBlogRepositoryImpl();

  getUserInfo() {
    var user = repo.getLoggedInUser();
    emit(user);
  }
}
