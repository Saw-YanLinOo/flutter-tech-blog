import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:techblog/domain/models/blog.dart';
import 'package:techblog/domain/repository/tech_blog_repository_impl.dart';
import 'package:techblog/presentation/bloc/profile/profile_event.dart';
import 'package:techblog/presentation/bloc/profile/profile_state.dart';

class ProfileBloc extends HydratedBloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(PorfileInitilaState()) {
    on<GetUserBlogEvent>(_getUserBlog);
  }

  final TechBlogRepositoryImpl _api = TechBlogRepositoryImpl();

  _getUserBlog(GetUserBlogEvent event, Emitter<ProfileState> emit) async {
    emit(GetUserBlogLoading());
    try {
      var result = await _api.getBlogByUserID(event.uID);

      emit(GetUserBlogSuccess(result));
    } catch (e) {
      emit(GetUserBlogFail(e));
    }
  }

  @override
  ProfileState? fromJson(Map<String, dynamic> json) {
    try {
      final list =
          (json['blogs'] as List).map((json) => Blog.fromJson(json)).toList();

      return GetUserBlogSuccess(list);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(ProfileState state) {
    if (state is GetUserBlogSuccess) {
      return {'user-blogs': state.list.map((user) => user.toJson()).toList()};
    } else {
      return null;
    }
  }
}
