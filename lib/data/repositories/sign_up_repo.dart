import 'package:job_search/core/utils/JSAppString.dart';
import 'package:job_search/data/data_source/http_helper.dart';

class SignUpRepository {
  final ApiBaseHelper apiHelper;

  SignUpRepository({required this.apiHelper});

  Future<bool> registerNewUser({required Map<String, String> body}) async {
    var response = await apiHelper.post(AppStrings.signUp, body: body);
    return response == "User registered successfully.";
  }
}
