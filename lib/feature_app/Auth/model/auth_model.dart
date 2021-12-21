import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  AuthModel({
    this.userGroup,
    this.token,
  });

  String? userGroup;
  String? token;

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        userGroup: json["user_group"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user_group": userGroup,
        "token": token,
      };
}
