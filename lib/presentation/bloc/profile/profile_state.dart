import 'package:equatable/equatable.dart';
import 'package:techblog/domain/models/blog.dart';

abstract class ProfileState extends Equatable {}

class PorfileInitilaState extends ProfileState {
  @override
  List<Object?> get props => [];
}

class GetUserBlogLoading extends ProfileState {
  @override
  List<Object?> get props => [];
}

class GetUserBlogSuccess extends ProfileState {
  final List<Blog> list;

  GetUserBlogSuccess(this.list);

  @override
  List<Object?> get props => [list];
}

class GetUserBlogFail extends ProfileState {
  final Object object;

  GetUserBlogFail(this.object);

  @override
  List<Object?> get props => [object];
}
