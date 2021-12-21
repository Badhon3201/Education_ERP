import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:student_management_system/feature_app/Auth/model/auth_model.dart';

import '../../app_error.dart';

class LoginRepository {
  String? msg;
  Future<Either<AppError, AuthModel>> fetchUserData(
      {String? username, String? password}) async {
    // BotToast.showLoading();
    var url = "https://hbhs.projonmosoft.com/api/app_login/";
    print(username);
    print(password);
    var response = await http.post(Uri.parse(url),
        body: {"username": username, "password": password});
    print(response.body);
    var decodedJson = json.decode(response.body);
    if (response.statusCode == 200) {
      // BotToast.closeAllLoading();
      print("shakil" + response.statusCode.toString());
      AuthModel data = authModelFromJson(response.body);
      msg = "${decodedJson["error"]}";
      print("aktt$msg");
      return Right(data);
    } else {
      // BotToast.closeAllLoading();
      //BotToast.showText(text: 'Fail Data');
      return Left(AppError.serverError);
    }
  }
}
