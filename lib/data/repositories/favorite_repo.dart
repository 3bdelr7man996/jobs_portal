import 'package:job_search/core/utils/JSAppString.dart';
import 'package:job_search/data/data_source/http_helper.dart';

class FavoriteRepository {
  final ApiBaseHelper apiHelper;

  FavoriteRepository({required this.apiHelper});

  Future<bool> addToFav(String slug) async {
    var response = await apiHelper.post(AppStrings.addJobToFav + slug);
    return response?['message'] == 'Job added to favourites';
  }

  Future<bool> removeFromFav(String slug) async {
    var response = await apiHelper.delete(AppStrings.removeJobFromFav + slug);
    return response?['message'] == 'Job removed from favourites';
  }
}
