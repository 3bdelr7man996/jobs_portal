import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:job_search/core/utils/JSAppString.dart';
import 'package:job_search/data/model/app_configurations_model.dart';
import 'package:job_search/data/model/job_details_model.dart';
import 'package:job_search/data/model/search_job_model.dart';
import 'package:job_search/data/repositories/home_repo.dart';
import 'package:job_search/view/screens/auth/JOSignInScreen.dart';
import 'package:nb_utils/nb_utils.dart';

class HomeProvider with ChangeNotifier {
  final HomeRepository repository;

  HomeProvider(this.repository);

  AppConfigurationModel? myConfigurations;
  Future<void> fetchAppConfigurations({bool reload = false}) async {
    try {
      if (myConfigurations == null || reload) {
        myConfigurations = await repository.fetchAppConfigurations();
      }
    } catch (e) {
      debugPrint("--------[ Error in fetchAppConfigurations ]---------------");
      debugPrint(e.toString());
    }
  }

  List<Configuration> selectedCountries = [];
  void updateSelectedCountries(List<Configuration> countries) {
    selectedCountries = countries;
    notifyListeners();
  }

  List<Configuration> selectedFunctions = [];
  void updateSelectedFunctions(List<Configuration> functionList) {
    selectedFunctions = functionList;
    notifyListeners();
  }

  List<Configuration> selectedIndustries = [];
  void updateSelectedIndustries(List<Configuration> industries) {
    selectedIndustries = industries;
    notifyListeners();
  }

  List<Configuration> selectedExperience = [];
  void updateSelectedExperience(List<Configuration> experience) {
    selectedExperience = experience;
    notifyListeners();
  }

  List<Configuration> selectedCarrerLevel = [];
  void updateSelectedCarrerLevel(List<Configuration> carrer) {
    selectedCarrerLevel = carrer;
    notifyListeners();
  }

  Configuration? selectedGender;
  void updateSelectedGender(Configuration gender) {
    selectedGender = gender;
    notifyListeners();
  }

  int? salaryFrom;
  int? salaryTo;
  void updateSalaryFrom(String from) {
    salaryFrom = int.parse(from);
    notifyListeners();
  }

  void updateSalaryTo(String salTo) {
    salaryTo = int.parse(salTo);
    notifyListeners();
  }

  String query = '';
  void updateQuery(String text) {
    query = text;
    notifyListeners();
  }

  void resetFilter() {
    salaryFrom = null;
    salaryTo = null;
    selectedGender = null;
  }

  void resetSearch() {
    query = '';
    salaryFrom = null;
    salaryTo = null;
    selectedGender = null;
    selectedCarrerLevel = [];
    selectedCountries = [];
    selectedExperience = [];
    selectedFunctions = [];
    selectedIndustries = [];
  }

  bool searchLoading = false;
  Jobs? fetchedJobs;
  List<SearchData> jobList = [];

  Future<void> searchJob() async {
    try {
      searchLoading = true;
      Future.delayed(Duration.zero, () {
        notifyListeners();
      });

      Map<String, String?> queryParameter = {
        "search": query,
        "gender_id[0]": selectedGender != null ? "${selectedGender?.id}" : null,
        "salary_from": salaryFrom != null ? "$salaryFrom" : null,
        "salary_to": salaryTo != null ? "$salaryTo" : null,
        "page": "1" //todo
      };

      for (var i = 0; i < selectedIndustries.length; i++) {
        queryParameter
            .addAll({"industry_id[$i]": "${selectedIndustries[i].id}"});
      }
      for (var i = 0; i < selectedCarrerLevel.length; i++) {
        queryParameter
            .addAll({"career_level_id[$i]": "${selectedCarrerLevel[i].id}"});
      }
      for (var i = 0; i < selectedFunctions.length; i++) {
        queryParameter
            .addAll({"functional_area_id[$i]": "${selectedFunctions[i].id}"});
      }
      for (var i = 0; i < selectedCountries.length; i++) {
        queryParameter.addAll({"country_id[$i]": "${selectedCountries[i].id}"});
      }
      for (var i = 0; i < selectedExperience.length; i++) {
        queryParameter
            .addAll({"job_experience_id[$i]": "${selectedExperience[i].id}"});
      }
      debugPrint("Search body : $queryParameter");
      fetchedJobs = await repository.searchJob(queryParameter);
      await cacheSearchResult();
      jobList = [];
      jobList.addAll(fetchedJobs?.data ?? []);
      debugPrint("Job List length ${jobList.length}");
      searchLoading = false;
      Future.delayed(Duration.zero, () {
        notifyListeners();
      });
    } catch (e) {
      debugPrint(e.toString());
      searchLoading = false;
      notifyListeners();
    }
  }

  Future<void> cacheSearchResult() async {
    if (query.isNotEmpty && fetchedJobs != null) {
      await removeKey(AppStrings.shprefSearch);
      await setValue(
          AppStrings.shprefSearch,
          jsonEncode(
            fetchedJobs?.toJson(),
          ));
    }
  }

  List<SearchData> localJobList = [];
  Future<void> getLocalSearchJob() async {
    try {
      String localData = getStringAsync(AppStrings.shprefSearch);
      localJobList = Jobs.fromJson(jsonDecode(localData)).data ?? [];
      Future.delayed(Duration.zero, () {
        notifyListeners();
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //?============================[ JOB DETAILS ]================================
  Job? jobDetails;
  bool detailsLoad = false;

  Future<void> fetchJobDetails(String slug) async {
    try {
      detailsLoad = true;
      Future.delayed(Duration.zero, () {
        notifyListeners();
      });
      jobDetails = await repository.fetchJobDetails(slug);
      detailsLoad = false;
      Future.delayed(Duration.zero, () {
        notifyListeners();
      });
    } catch (e) {
      jobDetails = null;
      debugPrint(e.toString());
      detailsLoad = false;
      Future.delayed(Duration.zero, () {
        notifyListeners();
      });
    }
  }

  bool applyLoader = false;
  Future<void> applyJob(BuildContext context, String slug) async {
    try {
      if (getStringAsync(AppStrings.userToken).isEmpty) {
        toast("You must be logged in.");
        finish(context);
        JOSignInScreen().launch(context);
        return;
      }
      applyLoader = true;
      Future.delayed(Duration.zero, () {
        notifyListeners();
      });
      await repository.applyJob(slug);
      toast("Success Applied", length: Toast.LENGTH_LONG);
      applyLoader = false;
      Future.delayed(Duration.zero, () {
        notifyListeners();
      });
      finish(context);
    } catch (e) {
      debugPrint(e.toString());
      toast("failed Applied");
      applyLoader = false;
      Future.delayed(Duration.zero, () {
        notifyListeners();
      });
    }
  }
}
