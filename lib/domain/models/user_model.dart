class UserModel {
  String? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? password;
  final String? avatorUrl;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.password,
    this.avatorUrl,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'avator_url': avatorUrl,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      avatorUrl: map['avator_url'] != null ? map['avator_url'] as String : null,
    );
  }
}
