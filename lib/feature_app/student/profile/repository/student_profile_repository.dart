import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:student_management_system/feature_app/Auth/view_model/access_token_view_model.dart';
import 'package:student_management_system/feature_app/app_error.dart';

import 'package:http/http.dart' as http;
import 'package:student_management_system/feature_app/student/profile/model/student_profile_model.dart';

class StudentProfileRepository {
  Future<Either<AppError, StudentProfileModel>> fetchProfile() async {
    var url = "http://hbhs.projonmosoft.com/api/app_profile/";
    var token = await AccessTokenProvider().getToken();
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'authorization': 'Token $token',
      },
    );

    if (response.statusCode == 200) {
      StudentProfileModel data = studentProfileModelFromJson(response.body);
      return Right(data);
    } else {
      BotToast.showText(text: 'Fail Data');
      return Left(AppError.serverError);
    }
  }
}
