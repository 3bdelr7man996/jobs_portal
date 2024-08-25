import 'package:flutter/material.dart';
import 'package:job_search/core/utils/JSAppString.dart';
import 'package:job_search/data/model/profile_model.dart';
import 'package:job_search/data/repositories/profile_repo.dart';
import 'package:nb_utils/nb_utils.dart';

class ProfileProvider with ChangeNotifier {
  final ProfileRepository repository;

  ProfileProvider(this.repository);

  User? joUser;
  bool profileLoad = false;
  bool updateLoad = false;

  String firstName = '';
  String middelName = '';
  String lastName = '';
  String mobile = '';
  String email = '';
  String password = '';
  String birthDate = '';
  String expectedSalary = '';
  String currentSalary = '';
  int? userIndustryId;
  int? userCountryId;
  int? userFunctionId;
  int? userCarrerId;
  int? userExperienceId;

  void setFirstName(String text) {
    firstName = text;
  }

  void setMiddleName(String text) {
    middelName = text;
  }

  void setLastNameName(String text) {
    lastName = text;
  }

  void setMobile(String text) {
    mobile = text;
  }

  void setEmail(String text) {
    email = text;
  }

  void setPassword(String text) {
    password = text;
  }

  void setBirthDate(String text) {
    birthDate = text;
  }

  void setExpectedSalary(String text) {
    expectedSalary = text;
  }

  void setCurrentSalary(String text) {
    currentSalary = text;
  }

  void setIndustry(int id) {
    userIndustryId = id;
    notifyListeners();
  }

  void setCountryId(int id) {
    userCountryId = id;
    notifyListeners();
  }

  void setFunctionId(int id) {
    userFunctionId = id;
    notifyListeners();
  }

  void setCarrerId(int id) {
    userCarrerId = id;
    notifyListeners();
  }

  void setExperienceId(int id) {
    userExperienceId = id;
    notifyListeners();
  }

  Future<void> fetchProfile({bool reload = false}) async {
    try {
      if (joUser == null || reload) {
        if (getStringAsync(AppStrings.userToken).isEmpty) {
          debugPrint("Token is Emotyy");
          return;
        }
        profileLoad = true;
        notifyListeners();
        joUser = await repository.fetchUserProfile();
        initProfile();
        profileLoad = false;
        notifyListeners();
      }
    } catch (e) {
      debugPrint(e.toString());
      profileLoad = false;
      notifyListeners();
    }
  }

  void initProfile() {
    if (joUser != null) {
      firstName = joUser?.firstName ?? '';
      middelName = joUser?.middleName ?? '';
      lastName = joUser?.lastName ?? '';
      mobile = joUser?.phone ?? '';
      email = joUser?.email ?? '';
      birthDate = joUser?.dateOfBirth ?? '';
      userIndustryId = joUser?.industryId ?? null;
      userCarrerId = joUser?.careerLevelId ?? null;
      userExperienceId = joUser?.jobExperienceId ?? null;
      userCountryId = joUser?.countryId ?? null;
      userFunctionId = joUser?.functionalAreaId ?? null;
      expectedSalary = joUser?.expectedSalary ?? '';
      currentSalary = joUser?.currentSalary ?? '';
    }
  }

  void validator() {
    if (userCarrerId == null) {
      toast("Select Carrer Level");
      throw ('');
    } else if (userCountryId == null) {
      toast("Select Your Country");
      throw ('');
    } else if (userExperienceId == null) {
      toast("Select Experience ");
      throw ('');
    } else if (userFunctionId == null) {
      toast("Select functional area");
      throw ('');
    } else if (userIndustryId == null) {
      toast("Select Industry ");
      throw ('');
    }
  }

  Future<void> updateProfile() async {
    try {
      updateLoad = true;
      notifyListeners();
      Map<String, String?> body = {
        "first_name": firstName,
        "middle_name": middelName,
        "last_name": lastName,
        "email": email,
        "password": password,
        "date_of_birth": birthDate,
        "gender_id": null,
        "marital_status_id": null,
        "nationality_id": null,
        "national_id_card_number": null,
        "country_id": userCountryId != null ? "$userCountryId" : null,
        "state_id": null,
        "city_id": null,
        "phone": mobile,
        "mobile_num": mobile,
        "job_experience_id":
            userExperienceId != null ? "$userExperienceId" : null,
        "career_level_id": userCarrerId != null ? "$userCarrerId" : null,
        "industry_id": userIndustryId != null ? "$userIndustryId" : null,
        "functional_area_id": userFunctionId != null ? "$userFunctionId" : null,
        "current_salary": currentSalary,
        "expected_salary": expectedSalary,
        "salary_currency": null,
        "video_link": null,
        "street_address": null,
        "is_subscribed": null,
      };
      debugPrint("Body $body");
      await repository.updateProfile(body: body);
      updateLoad = false;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
      updateLoad = false;
      notifyListeners();
    }
  }
}
