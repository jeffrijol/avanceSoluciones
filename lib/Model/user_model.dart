class UserModel {
  UserModel({
    required this.user,
    required this.token,
  });
  late final User user;
  late final String token;
  
  UserModel.fromJson(Map<String, dynamic> json){
    user = User.fromJson(json['user']);
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user'] = user.toJson();
    data['token'] = token;
    return data;
  }
}

class User {
  User({
    required this.id,
    required this.email,
    required this.pass,
    required this.displayName,
    required this.signupDate,
    required this.userId,
    required this.rol,
    required this.avatar,
    required this.v,
  });
  late final String id;
  late final String email;
  late final String pass;
  late final String displayName;
  late final String signupDate;
  late final String userId;
  late final String rol;
  late final String avatar;
  late final int v;
  
  User.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    email = json['email'];
    pass = json['pass'];
    displayName = json['displayName'];
    signupDate = json['signupDate'];
    userId = json['userId'];
    rol = json['rol'];
    avatar = json['avatar'];
    v = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['email'] = email;
    data['pass'] = pass;
    data['displayName'] = displayName;
    data['signupDate'] = signupDate;
    data['userId'] = userId;
    data['rol'] = rol;
    data['avatar'] = avatar;
    data['__v'] = v;
    return data;
  }
}