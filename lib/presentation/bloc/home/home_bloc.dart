import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techblog/domain/repository/tech_blog_repository.dart';
import 'package:techblog/domain/repository_impl/tech_blog_repository_impl.dart';
import 'package:techblog/presentation/bloc/home/home_event.dart';
import 'package:techblog/presentation/bloc/home/home_state.dart';
import 'package:techblog/presentation/screens/home/home_screen.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(super.initialState) {}
}
