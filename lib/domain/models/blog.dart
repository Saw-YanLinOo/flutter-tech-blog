// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';

class Blog {
  final String? id;
  final String? category;
  final String? title;
  final String? description;
  final String? type;
  final String? imageUrl;
  final DateTime? date;
  final String? link;
  final List<dynamic>? tag;
  final num? view;
  final String? userId;
  final String? userName;
  final String? userEmail;
  final int? feature;
  final String? userAvatorUrl;
  Blog({
    this.id,
    this.category,
    this.title,
    this.description,
    this.type,
    this.imageUrl,
    this.date,
    this.link,
    this.tag,
    this.view,
    this.userId,
    this.userName,
    this.userEmail,
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
      'url': imageUrl,
      'date': date?.millisecondsSinceEpoch,
      'link': link,
      'tag': tag,
      'view': view,
      'user_id': userId,
      'user_name': userName,
      'user_email': userEmail,
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
      imageUrl: map['url'] != null ? map['url'] as String : null,
      date: map['date'] != null ? (map['date'] as Timestamp).toDate() : null,
      link: map['link'] != null ? map['link'] as String : null,
      tag: map['tag'] != null
          ? List<dynamic>.from((map['tag'] as List<dynamic>))
          : null,
      view: map['view'] != null ? map['view'] as num : null,
      userId: map['user_id'] != null ? map['user_id'] as String : null,
      userName: map['user_name'] != null ? map['user_name'] as String : null,
      userEmail: map['user_email'] != null ? map['user_email'] as String : null,
      feature: map['feature'] != null ? map['feature'] as int : null,
      userAvatorUrl: map['user_avator_url'] != null
          ? map['user_avator_url'] as String
          : null,
    );
  }
}
