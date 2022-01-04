import 'package:flutter/cupertino.dart';
import 'package:student_management_system/feature_app/app_error.dart';
import 'package:student_management_system/feature_app/teacher/teacher_dashboard/model/student_list_model.dart';
import 'package:student_management_system/feature_app/teacher/teacher_dashboard/repository/student_search_repository.dart';

class StudentListViewModel extends ChangeNotifier {
  bool _isLoading = false;
  AppError? _appError;
  List<StudentListModel> _studentList = [];
  String? statusCode;
  Future getStudentData(
      {String? classes, String? section, String? group}) async {
    _isLoading = true;
    var res = await StudentListRepository()
        .fetchData(classes: classes, section: section, group: group);

    notifyListeners();
    res.fold((l) {
      print('dddd');
      _appError = l;
      _isLoading = false;
      notifyListeners();
    }, (r) {
      print("sss");
      _isLoading = false;
      _studentList = r;
      print('gtgt$_studentList');
      notifyListeners();
    });
  }

  List<StudentListModel> get studentList => _studentList;
}
