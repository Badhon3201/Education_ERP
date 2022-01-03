import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:student_management_system/feature_app/Auth/view_model/access_token_view_model.dart';
import 'package:student_management_system/feature_app/app_error.dart';
import 'package:http/http.dart' as http;
import 'package:student_management_system/feature_app/student/profile/model/fees_list_model.dart';

class FeesRepository {
  Future<Either<AppError, List<FeesModel>>> fetchProfileFees() async {
    var url = "https://hbhs.projonmosoft.com/api/app_fees/";
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
      List<FeesModel> data = feesModelFromJson(response.body);
      return Right(data);
    } else {
      BotToast.showText(text: 'Fail Data');
      return const Left(AppError.serverError);
    }
  }
}
