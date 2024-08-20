import 'package:flutter/widgets.dart';
import 'package:job_search/core/utils/JSAppString.dart';
import 'package:job_search/data/data_source/http_helper.dart';
import 'package:job_search/data/repositories/sign_in_repo.dart';
import 'package:job_search/di_container.dart';
import 'package:job_search/view/screens/home/JSJobSearchScreen.dart';
import 'package:nb_utils/nb_utils.dart';

class SignInProvider with ChangeNotifier {
  final SignInRepository repository;

  String _email = '';

  String _password = '';
  bool _signInLoad = false;

  SignInProvider({required this.repository});

  String get email => _email;
  String get password => _password;
  bool get signInLoad => _signInLoad;

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  bool validate() {
    if (_password.isEmpty) {
      toast('Password is required');
      return false;
    } else if (_email.isEmpty) {
      toast('Please fill in all required fields.');
      return false;
    }
    return true;
  }

  Future<void> signIn(BuildContext context) async {
    if (validate()) {
      try {
        _signInLoad = true;
        notifyListeners();
        var response = await repository.SignInUser(body: {
          "email": _email,
          "password": _password,
        });
        if (response != null) {
          await cacheToken(response);
          sl<ApiBaseHelper>().updateHeader();
          _signInLoad = false;
          notifyListeners();
          JSJobSearchScreen().launch(context, isNewTask: true);
        } else {
          _signInLoad = false;
          notifyListeners();
          toast("Failed Login");
        }
      } catch (e) {
        _signInLoad = false;
        notifyListeners();
        toast("Failed Login \n$e");
      }
    }
  }

  Future<void> cacheToken(String token) async {
    await setValue(AppStrings.userToken, token);
  }
}
