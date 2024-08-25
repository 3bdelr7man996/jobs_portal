class UserProfile {
  User? user;
  int? uploadMaxFilesize;

  UserProfile({this.user, this.uploadMaxFilesize});

  UserProfile.fromJson(Map<String, dynamic>? json) {
    user = json?['user'] != null ? new User.fromJson(json?['user']) : null;
    uploadMaxFilesize = json?['upload_max_filesize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['upload_max_filesize'] = this.uploadMaxFilesize;
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? middleName;
  String? lastName;
  String? name;
  String? email;
  String? fatherName;
  String? dateOfBirth;
  int? genderId;
  int? maritalStatusId;
  int? nationalityId;
  String? nationalIdCardNumber;
  var countryId;
  var stateId;
  var cityId;
  String? phone;
  String? mobileNum;
  var jobExperienceId;
  var careerLevelId;
  var industryId;
  var functionalAreaId;
  var currentSalary;
  var expectedSalary;
  var salaryCurrency;
  var streetAddress;
  var isActive;
  var verified;
  String? verificationToken;
  String? image;
  var bioVideo;
  String? coverImage;
  var lang;
  var isImmediateAvailable;
  int? numProfileViews;
  int? packageId;
  int? jobsQuota;
  int? availedJobsQuota;
  var search;
  int? isSubscribed;
  var videoLink;

  User({
    this.id,
    this.firstName,
    this.middleName,
    this.lastName,
    this.name,
    this.email,
    this.fatherName,
    this.dateOfBirth,
    this.genderId,
    this.maritalStatusId,
    this.nationalityId,
    this.nationalIdCardNumber,
    this.countryId,
    this.stateId,
    this.cityId,
    this.phone,
    this.mobileNum,
    this.jobExperienceId,
    this.careerLevelId,
    this.industryId,
    this.functionalAreaId,
    this.currentSalary,
    this.expectedSalary,
    this.salaryCurrency,
    this.streetAddress,
    this.isActive,
    this.verified,
    this.verificationToken,
    this.image,
    this.bioVideo,
    this.coverImage,
    this.lang,
    this.isImmediateAvailable,
    this.numProfileViews,
    this.packageId,
    this.jobsQuota,
    this.availedJobsQuota,
    this.search,
    this.isSubscribed,
    this.videoLink,
  });

  User.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    firstName = json?['first_name'];
    middleName = json?['middle_name'];
    lastName = json?['last_name'];
    name = json?['name'];
    email = json?['email'];
    fatherName = json?['father_name'];
    dateOfBirth = json?['date_of_birth'];
    genderId = json?['gender_id'] != null
        ? int.parse(json!['gender_id'].toString())
        : null;
    maritalStatusId = json?['marital_status_id'];
    nationalityId = json?['nationality_id'];
    nationalIdCardNumber = json?['national_id_card_number'];
    countryId = json?['country_id'] != null
        ? int.parse(json!['country_id'].toString())
        : null;
    stateId = json?['state_id'] != null
        ? int.parse(json!['state_id'].toString())
        : null;
    cityId = json?['city_id'] != null
        ? int.parse(json!['city_id'].toString())
        : null;
    phone = json?['phone'];
    mobileNum = json?['mobile_num'];
    jobExperienceId = json?['job_experience_id'] != null
        ? int.parse(json!['job_experience_id'].toString())
        : null;
    careerLevelId = json?['career_level_id'] != null
        ? int.parse(json!['career_level_id'].toString())
        : null;
    industryId = json?['industry_id'] != null
        ? int.parse(json!['industry_id'].toString())
        : null;
    functionalAreaId = json?['functional_area_id'] != null
        ? int.parse(json!['functional_area_id'].toString())
        : null;
    currentSalary = json?['current_salary'];
    expectedSalary = json?['expected_salary'];
    salaryCurrency = json?['salary_currency'];
    streetAddress = json?['street_address'];
    isActive = json?['is_active'];
    verified = json?['verified'];
    verificationToken = json?['verification_token'];

    image = json?['image'];
    bioVideo = json?['bio_video'];
    coverImage = json?['cover_image'];
    lang = json?['lang'];

    isImmediateAvailable = json?['is_immediate_available'];
    numProfileViews = json?['num_profile_views'];
    packageId = json?['package_id'];

    jobsQuota = json?['jobs_quota'];
    availedJobsQuota = json?['availed_jobs_quota'];
    search = json?['search'];
    isSubscribed = json?['is_subscribed'];
    videoLink = json?['video_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['middle_name'] = this.middleName;
    data['last_name'] = this.lastName;
    data['name'] = this.name;
    data['email'] = this.email;
    data['father_name'] = this.fatherName;
    data['date_of_birth'] = this.dateOfBirth;
    data['gender_id'] = this.genderId;
    data['marital_status_id'] = this.maritalStatusId;
    data['nationality_id'] = this.nationalityId;
    data['national_id_card_number'] = this.nationalIdCardNumber;
    data['country_id'] = this.countryId;
    data['state_id'] = this.stateId;
    data['city_id'] = this.cityId;
    data['phone'] = this.phone;
    data['mobile_num'] = this.mobileNum;
    data['job_experience_id'] = this.jobExperienceId;
    data['career_level_id'] = this.careerLevelId;
    data['industry_id'] = this.industryId;
    data['functional_area_id'] = this.functionalAreaId;
    data['current_salary'] = this.currentSalary;
    data['expected_salary'] = this.expectedSalary;
    data['salary_currency'] = this.salaryCurrency;
    data['street_address'] = this.streetAddress;
    data['is_active'] = this.isActive;
    data['verified'] = this.verified;
    data['verification_token'] = this.verificationToken;

    data['image'] = this.image;
    data['bio_video'] = this.bioVideo;
    data['cover_image'] = this.coverImage;
    data['lang'] = this.lang;

    data['is_immediate_available'] = this.isImmediateAvailable;
    data['num_profile_views'] = this.numProfileViews;
    data['package_id'] = this.packageId;

    data['jobs_quota'] = this.jobsQuota;
    data['availed_jobs_quota'] = this.availedJobsQuota;
    data['search'] = this.search;
    data['is_subscribed'] = this.isSubscribed;
    data['video_link'] = this.videoLink;
    return data;
  }
}
