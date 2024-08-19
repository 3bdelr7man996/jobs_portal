import 'package:flutter/widgets.dart';
import 'package:job_search/data/repositories/sign_up_repo.dart';
import 'package:job_search/view/screens/JSJobSearchScreen.dart';
import 'package:nb_utils/nb_utils.dart';

class SignUpProvider with ChangeNotifier {
  final SignUpRepository repository;

  String _email = '';
  String _firstName = '';
  String _lastName = '';
  String _password = '';
  String _confirmPassword = '';
  bool _signupLoad = false;

  SignUpProvider({required this.repository});

  String get email => _email;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get password => _password;
  String get confirmPassword => _confirmPassword;
  bool get signUpLoad => _signupLoad;

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setFirstName(String firstName) {
    _firstName = firstName;
    notifyListeners();
  }

  void setLastName(String lastName) {
    _lastName = lastName;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  void setConfirmPassword(String confirmPassword) {
    _confirmPassword = confirmPassword;
    notifyListeners();
  }

  bool validate() {
    if (_password.length < 8) {
      toast('Password must be at least 8 characters long.');
      return false;
    } else if (!_password.contains(RegExp(r'\d'))) {
      toast('Password must contain at least one digit.');
      return false;
    } else if (!_password.contains(RegExp(r'[A-Za-z]'))) {
      toast('Password must contain at least one letter.');
      return false;
    } else if (_password != _confirmPassword) {
      toast('Passwords do not match.');
      return false;
    } else if (_email.isEmpty || _firstName.isEmpty || _lastName.isEmpty) {
      toast('Please fill in all required fields.');
      return false;
    }
    return true;
  }

  Future<void> signUp(BuildContext context) async {
    if (validate()) {
      try {
        _signupLoad = true;
        notifyListeners();
        await repository.registerNewUser(body: {
          "first_name": _firstName,
          "last_name": _lastName,
          "email": _email,
          "password": _password,
          "password_confirmation": _confirmPassword,
        });
        _signupLoad = false;
        notifyListeners();
        JSJobSearchScreen().launch(context, isNewTask: true);
      } catch (e) {
        _signupLoad = false;
        notifyListeners();
        toast("Failed Sign Up \n$e");
      }
    }
  }
}
