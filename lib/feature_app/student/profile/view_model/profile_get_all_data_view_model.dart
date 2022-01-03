import 'package:flutter/cupertino.dart';
import 'package:student_management_system/feature_app/app_error.dart';
import 'package:student_management_system/feature_app/student/profile/model/student_profile_model.dart';
import 'package:student_management_system/feature_app/student/profile/repository/student_profile_repository.dart';

class StudentProfileDataViewModel extends ChangeNotifier {
  bool _isLoading = false;
  AppError? _appError;
  StudentProfileModel? _studentProfileModel;
  Future getProfileData() async {
    _isLoading = true;
    var res = await StudentProfileRepository().fetchProfile();

    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isLoading = false;
      notifyListeners();
    }, (r) {
      _isLoading = false;
      _studentProfileModel = r;
      notifyListeners();
    });
  }

  StudentProfileModel? get studentProfileModel => _studentProfileModel;
}
