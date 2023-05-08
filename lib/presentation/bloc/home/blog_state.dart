// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:techblog/domain/models/blog.dart';

abstract class BlogState extends Equatable {}

class GetAllBlogSuccessState extends BlogState {
  final List<Blog> blogList;
  GetAllBlogSuccessState({
    required this.blogList,
  });

  @override
  List<Object?> get props => [blogList];
}

class GetAllBlogInitialState extends BlogState {
  @override
  List<Object?> get props => [];
}

class GetAllBlogLoadingState extends BlogState {
  @override
  List<Object?> get props => [];
}

class GetAllBlogFailStae extends BlogState {
  final Object? e;
  GetAllBlogFailStae({
    this.e,
  });

  @override
  List<Object?> get props => [e];
}
