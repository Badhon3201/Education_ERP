import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:student_management_system/feature_app/Auth/view_model/access_token_view_model.dart';
import 'package:student_management_system/feature_app/teacher/teacher_dashboard/model/student_list_model.dart';
import 'package:http/http.dart' as http;
import '../../../app_error.dart';

class StudentListRepository {
  String? msg;
  int? statusCode;
  Future<Either<AppError, List<StudentListModel>>> fetchData(
      {String? classes, String? section, String? group}) async {
    // BotToast.showLoading();
    print(classes);
    print(section);
    print(group);
    var body1 = {"classes": "$classes", "section": "$section", "group": ""};
    var url = "https://hbhs.projonmosoft.com/api/app_students/";
    var token = await AccessTokenProvider().getToken();
    var response = await http.post(Uri.parse(url), body: body1, headers: {
      // 'Content-Type': 'text/plain',
      'Accept': 'application/json',
      'authorization': 'Token $token',
    });
    debugPrint(response.body);
    print("body1$body1");
    statusCode = response.statusCode;
    var decodedJson = json.decode(response.body);
    if (response.statusCode == 200) {
      // BotToast.closeAllLoading();
      print("shakil" + response.statusCode.toString());
      List<StudentListModel> data = studentListModelFromJson(response.body);
      // msg = "${decodedJson["error"]}";
      // print("aktt$msg");
      return Right(data);
    } else {
      // BotToast.closeAllLoading();
      //BotToast.showText(text: 'Fail Data');
      return Left(AppError.serverError);
    }
  }
}
