import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techblog/domain/repository/tech_blog_repository.dart';
import 'package:techblog/presentation/bloc/home/blog_state.dart';
import 'package:techblog/presentation/bloc/home/blog_event.dart';

import '../../../domain/repository/tech_blog_repository_impl.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
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
}
