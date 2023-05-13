// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';

class Blog {
  final String? id;
  final String? category;
  final String? title;
  final String? description;
  final String? type;
  final String? url;
  final DateTime? date;
  final String? link;
  final List<String>? tags;
  final num? view;
  final String? userId;
  final String? userName;
  final int? feature;
  final String? userAvatorUrl;
  Blog({
    this.id,
    this.category,
    this.title,
    this.description,
    this.type,
    this.url,
    this.date,
    this.link,
    this.tags,
    this.view,
    this.userId,
    this.userName,
    this.userAvatorUrl,
    this.feature,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'category': category,
      'title': title,
      'description': description,
      'type': type,
      'url': url,
      'date': date?.millisecondsSinceEpoch,
      'link': link,
      'tags': tags,
      'view': view,
      'user_id': userId,
      'user_name': userName,
      'user_avator_url': userAvatorUrl,
      'feature': feature,
    };
  }

  factory Blog.fromJson(Map<String, dynamic> map) {
    return Blog(
      id: map['id'] != null ? map['id'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
      date: map['date'] != null ? (map['date'] as Timestamp).toDate() : null,
      link: map['link'] != null ? map['link'] as String : null,
      tags: map['tags'] != null
          ? List<String>.from((map['tags'] as List<String>))
          : null,
      view: map['view'] != null ? map['view'] as num : null,
      userId: map['user_id'] != null ? map['user_id'] as String : null,
      userName: map['user_name'] != null ? map['user_name'] as String : null,
      feature: map['feature'] != null ? map['feature'] as int : null,
      userAvatorUrl: map['user_avator_url'] != null
          ? map['user_avator_url'] as String
          : null,
    );
  }
}
