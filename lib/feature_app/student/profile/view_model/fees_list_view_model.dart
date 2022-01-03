import 'package:flutter/cupertino.dart';
import 'package:student_management_system/feature_app/app_error.dart';
import 'package:student_management_system/feature_app/student/profile/model/fees_list_model.dart';
import 'package:student_management_system/feature_app/student/profile/repository/fees_list_repository.dart';

class StudentFeesViewModel extends ChangeNotifier {
  bool _isLoading = false;
  AppError? _appError;
  List<FeesModel> _fees = [];
  Future getProfileData() async {
    _isLoading = true;
    var res = await FeesRepository().fetchProfileFees();

    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isLoading = false;
      notifyListeners();
    }, (r) {
      _isLoading = false;
      _fees = r;
      notifyListeners();
    });
  }

  List<FeesModel> get fees => _fees;
}
