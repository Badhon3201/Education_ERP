import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:student_management_system/feature_app/app_error.dart';
import 'package:student_management_system/feature_app/profile/model/student_profile_model.dart';
import 'package:http/http.dart' as http;

class StudentProfileRepository {
  Future<Either<AppError, StudentProfileModel>> fetchProfile() async {
    var url = "http://hbhs.projonmosoft.com/api/app_profile/";
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'authorization': 'Token 9557833ae23ebdeef6df02ca0e72e69cc623a27c',
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
