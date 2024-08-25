import 'package:job_search/core/utils/JSAppString.dart';
import 'package:job_search/data/data_source/http_helper.dart';
import 'package:job_search/data/model/app_configurations_model.dart';
import 'package:job_search/data/model/job_details_model.dart';
import 'package:job_search/data/model/search_job_model.dart';

class HomeRepository {
  final ApiBaseHelper apiHelper;

  HomeRepository({required this.apiHelper});

  Future<AppConfigurationModel> fetchAppConfigurations() async {
    var response = await apiHelper.get(AppStrings.appConfigurations);
    AppConfigurationModel responseModel =
        AppConfigurationModel.fromJson(response);
    return responseModel;
  }

  Future<Jobs?> searchJob(Map<String, String?> query) async {
    var response =
        await apiHelper.get(AppStrings.jobSearch, queryParameters: query);
    SearchJobModel responseModel = SearchJobModel.fromJson(response);
    return responseModel.jobs;
  }

  Future<Job?> fetchJobDetails(String slug) async {
    var response = await apiHelper.get(AppStrings.jobDetails + "$slug");
    JobDetailsModel responseModel = JobDetailsModel.fromJson(response);
    return responseModel.job;
  }

  Future<Job?> applyJob(String slug) async {
    var response = await apiHelper.post(AppStrings.applyJob + "$slug");
    JobDetailsModel responseModel = JobDetailsModel.fromJson(response);
    return responseModel.job;
  }
}
