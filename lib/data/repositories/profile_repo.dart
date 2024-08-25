import 'package:job_search/core/utils/JSAppString.dart';
import 'package:job_search/data/data_source/http_helper.dart';
import 'package:job_search/data/model/profile_model.dart';

class ProfileRepository {
  final ApiBaseHelper apiHelper;

  ProfileRepository({required this.apiHelper});

  Future<User?> fetchUserProfile() async {
    UserProfile response =
        UserProfile.fromJson(await apiHelper.get(AppStrings.getProfile));
    return response.user;
  }

  Future<bool?> updateProfile({
    required Map<String, String?> body,
  }) async {
    var response = await apiHelper.multiPartRequest(
      AppStrings.updateProfile,
      body: body,
      files: [],
      fileKey: '',
    );
    return response?['message'] == 'Profile updated successfully';
  }
}
