import 'package:flutter/cupertino.dart';
import 'package:student_management_system/feature_app/app_error.dart';
import 'package:student_management_system/feature_app/teacher/teacher_dashboard/model/student_list_model.dart';
import 'package:student_management_system/feature_app/teacher/teacher_dashboard/repository/student_search_repository.dart';

class StudentListViewModel extends ChangeNotifier {
  bool _isLoading = false;
  AppError? _appError;
  List<StudentListModel> _studentList = [];
  Future getProfileData() async {
    _isLoading = true;
    var res = await StudentListRepository().fetchData();

    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isLoading = false;
      notifyListeners();
    }, (r) {
      _isLoading = false;
      _studentList = r;
      notifyListeners();
    });
  }

  List<StudentListModel> get studentList => _studentList;
}
