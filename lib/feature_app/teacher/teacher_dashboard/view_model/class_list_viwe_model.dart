import 'package:flutter/cupertino.dart';
import 'package:student_management_system/feature_app/app_error.dart';
import 'package:student_management_system/feature_app/teacher/teacher_dashboard/model/class_list_model.dart';
import 'package:student_management_system/feature_app/teacher/teacher_dashboard/repository/class_list_repository.dart';

class ClassListViewModel extends ChangeNotifier {
  bool _isLoading = false;
  AppError? _appError;
  List<ClassListModel> _classList = [];
  List<ClassListModel> _groupList = [];
  List<ClassListModel> _sectionList = [];
  String? statusCode;

  Future getClassestData() async {
    _isLoading = true;
    var res = await ClassListRepository().fetchClasses();

    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isLoading = false;
      notifyListeners();
    }, (r) {
      _isLoading = false;
      _classList = r;
      // debugPrint('gtgt$_classList');
      notifyListeners();
    });
  }

  Future getGroupData() async {
    _isLoading = true;
    var res = await ClassListRepository().fetchGroup();

    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isLoading = false;
      notifyListeners();
    }, (r) {
      _isLoading = false;
      _groupList = r;
      // debugPrint('gtgt$_groupList');
      notifyListeners();
    });
  }

  Future getSectionData() async {
    _isLoading = true;
    var res = await ClassListRepository().fetchSection();

    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isLoading = false;
      notifyListeners();
    }, (r) {
      _isLoading = false;
      _sectionList = r;
      // debugPrint('gtgt$_sectionList');
      notifyListeners();
    });
  }

  List<ClassListModel> get classList => _classList;
  List<ClassListModel> get groupList => _groupList;
  List<ClassListModel> get sectionList => _sectionList;
}
