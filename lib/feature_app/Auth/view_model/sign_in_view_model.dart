import 'package:flutter/cupertino.dart';
import 'package:student_management_system/feature_app/Auth/repository/login_repository.dart';

class SignInViewModel with ChangeNotifier {
  String? _accessToken;
  String? _refreshToken;
  bool _isLoading = false;

  get errorTextEmail => null;
  Future<void> getSignInData({String? username, String? password}) async {
    print(username);
    _isLoading = true;
    notifyListeners();
    var res = await LoginRepository()
        .fetchUserData(username: username, password: password);
    res.fold((l) {
      _isLoading = false;
    }, (r) {
      _isLoading = false;
      _accessToken = r.token;
    });
  }

  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;
  bool get isLoading => _isLoading;
}
