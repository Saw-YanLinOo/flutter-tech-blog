import 'package:equatable/equatable.dart';

abstract class BlogEvent extends Equatable {}

class GetAllBlogEvent extends BlogEvent {
  @override
  List<Object?> get props => [];
}
