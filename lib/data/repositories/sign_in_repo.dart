import 'package:job_search/core/utils/JSAppString.dart';
import 'package:job_search/data/data_source/http_helper.dart';

class SignInRepository {
  final ApiBaseHelper apiHelper;

  SignInRepository({required this.apiHelper});

  Future<String?> SignInUser({required Map<String, String> body}) async {
    var response = await apiHelper.post(AppStrings.signIn, body: body);
    return response?['token'];
  }
}
