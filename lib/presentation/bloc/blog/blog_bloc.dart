import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techblog/domain/models/blog.dart';
import 'package:techblog/presentation/bloc/blog/blog_state.dart';
import 'package:techblog/presentation/bloc/blog/blog_event.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../../../domain/repository/tech_blog_repository_impl.dart';

class BlogBloc extends HydratedBloc<BlogEvent, BlogState> {
  BlogBloc() : super(GetAllBlogInitialState()) {
    on<GetAllBlogEvent>(_getAllBlogEvent);
  }

  final TechBlogRepositoryImpl repo = TechBlogRepositoryImpl();
  _getAllBlogEvent(GetAllBlogEvent event, Emitter<BlogState> emit) async {
    emit(GetAllBlogInitialState());
    try {
      var response = await repo.getAllBlog();

      emit(GetAllBlogSuccessState(blogList: response));
    } catch (e) {
      emit(GetAllBlogFailStae(e: e));
    }
  }

  @override
  BlogState? fromJson(Map<String, dynamic> json) {
    try {
      final blogList =
          (json['blogs'] as List).map((json) => Blog.fromJson(json)).toList();

      return GetAllBlogSuccessState(blogList: blogList);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(BlogState state) {
    if (state is GetAllBlogSuccessState) {
      return {'blogs': state.blogList.map((user) => user.toJson()).toList()};
    } else {
      return null;
    }
  }
}
