import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {}

class GetUserBlogEvent extends ProfileEvent {
  final String uID;

  GetUserBlogEvent(this.uID);

  @override
  List<Object?> get props => [uID];
}
