class LoginResponse {
  final String? message;
  final String? token;

  LoginResponse({this.message, this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(message: json['message'], token: json['token']);
  }

  Map<String, dynamic> toJson() {
    return {'message': message, 'token': token};
  }
}

class UserData {
  final String? username;
  final String? password;

  UserData({this.username, this.password});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(username: json['username'], password: json['password']);
  }

  Map<String, dynamic> toJson() {
    return {'username': username, 'password': password};
  }
}
