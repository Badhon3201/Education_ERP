import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:student_management_system/feature_app/Auth/view_model/access_token_view_model.dart';
import 'package:student_management_system/feature_app/app_error.dart';

import 'package:http/http.dart' as http;
import 'package:student_management_system/feature_app/teacher/teacher_dashboard/model/class_list_model.dart';

class ClassListRepository {
  Future<Either<AppError, List<ClassListModel>>> fetchClasses() async {
    var url = "https://hbhs.projonmosoft.com/api/app_classes/";
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
      List<ClassListModel> data = classListModelFromJson(response.body);
      // debugPrint("Akram${response.body}");
      return Right(data);
    } else {
      BotToast.showText(text: 'Fail Data');
      return const Left(AppError.serverError);
    }
  }

  Future<Either<AppError, List<ClassListModel>>> fetchSection() async {
    var url = "https://hbhs.projonmosoft.com/api/app_section/";
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
      List<ClassListModel> data = classListModelFromJson(response.body);
      // debugPrint("Akram${response.body}");
      return Right(data);
    } else {
      BotToast.showText(text: 'Fail Data');
      return const Left(AppError.serverError);
    }
  }

  Future<Either<AppError, List<ClassListModel>>> fetchGroup() async {
    var url = "https://hbhs.projonmosoft.com/api/app_group/";
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
      List<ClassListModel> data = classListModelFromJson(response.body);
      // debugPrint("Akram${response.body}");
      return Right(data);
    } else {
      BotToast.showText(text: 'Fail Data');
      return const Left(AppError.serverError);
    }
  }
}
