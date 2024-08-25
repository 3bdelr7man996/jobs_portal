class JobDetailsModel {
  Job? job;
  Seo? seo;

  JobDetailsModel({this.job, this.seo});

  JobDetailsModel.fromJson(Map<String, dynamic>? json) {
    job = json?['job'] != null ? new Job.fromJson(json?['job']) : null;

    seo = json?['seo'] != null ? new Seo.fromJson(json?['seo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.job != null) {
      data['job'] = this.job!.toJson();
    }

    if (this.seo != null) {
      data['seo'] = this.seo!.toJson();
    }
    return data;
  }
}

class Job {
  int? id;
  int? companyId;
  String? title;
  String? description;
  String? benefits;
  int? countryId;
  int? stateId;
  int? cityId;
  int? isFreelance;
  int? careerLevelId;
  int? salaryFrom;
  int? salaryTo;
  int? hideSalary;
  String? salaryCurrency;
  int? salaryPeriodId;
  int? functionalAreaId;
  int? jobTypeId;
  int? jobShiftId;
  int? numOfPositions;
  int? genderId;
  String? expiryDate;
  int? degreeLevelId;
  int? jobExperienceId;
  int? isActive;
  int? isFeatured;
  String? createdAt;
  String? updatedAt;
  String? search;
  String? slug;
  var reference;
  var location;
  String? logo;
  var type;
  var postalCode;
  var jobAdvertiser;
  var applicationUrl;

  Job({
    this.id,
    this.companyId,
    this.title,
    this.description,
    this.benefits,
    this.countryId,
    this.stateId,
    this.cityId,
    this.isFreelance,
    this.careerLevelId,
    this.salaryFrom,
    this.salaryTo,
    this.hideSalary,
    this.salaryCurrency,
    this.salaryPeriodId,
    this.functionalAreaId,
    this.jobTypeId,
    this.jobShiftId,
    this.numOfPositions,
    this.genderId,
    this.expiryDate,
    this.degreeLevelId,
    this.jobExperienceId,
    this.isActive,
    this.isFeatured,
    this.createdAt,
    this.updatedAt,
    this.search,
    this.slug,
    this.reference,
    this.location,
    this.logo,
    this.type,
    this.postalCode,
    this.jobAdvertiser,
    this.applicationUrl,
  });

  Job.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    companyId = json?['company_id'];
    title = json?['title'];
    description = json?['description'];
    benefits = json?['benefits'];
    countryId = json?['country_id'];
    stateId = json?['state_id'];
    cityId = json?['city_id'];
    isFreelance = json?['is_freelance'];
    careerLevelId = json?['career_level_id'];
    salaryFrom = json?['salary_from'];
    salaryTo = json?['salary_to'];
    hideSalary = json?['hide_salary'];
    salaryCurrency = json?['salary_currency'];
    salaryPeriodId = json?['salary_period_id'];
    functionalAreaId = json?['functional_area_id'];
    jobTypeId = json?['job_type_id'];
    jobShiftId = json?['job_shift_id'];
    numOfPositions = json?['num_of_positions'];
    genderId = json?['gender_id'];
    expiryDate = json?['expiry_date'];
    degreeLevelId = json?['degree_level_id'];
    jobExperienceId = json?['job_experience_id'];
    isActive = json?['is_active'];
    isFeatured = json?['is_featured'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
    search = json?['search'];
    slug = json?['slug'];
    reference = json?['reference'];
    location = json?['location'];
    logo = json?['logo'];
    type = json?['type'];
    postalCode = json?['postal_code'];
    jobAdvertiser = json?['job_advertiser'];
    applicationUrl = json?['application_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['company_id'] = this.companyId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['benefits'] = this.benefits;
    data['country_id'] = this.countryId;
    data['state_id'] = this.stateId;
    data['city_id'] = this.cityId;
    data['is_freelance'] = this.isFreelance;
    data['career_level_id'] = this.careerLevelId;
    data['salary_from'] = this.salaryFrom;
    data['salary_to'] = this.salaryTo;
    data['hide_salary'] = this.hideSalary;
    data['salary_currency'] = this.salaryCurrency;
    data['salary_period_id'] = this.salaryPeriodId;
    data['functional_area_id'] = this.functionalAreaId;
    data['job_type_id'] = this.jobTypeId;
    data['job_shift_id'] = this.jobShiftId;
    data['num_of_positions'] = this.numOfPositions;
    data['gender_id'] = this.genderId;
    data['expiry_date'] = this.expiryDate;
    data['degree_level_id'] = this.degreeLevelId;
    data['job_experience_id'] = this.jobExperienceId;
    data['is_active'] = this.isActive;
    data['is_featured'] = this.isFeatured;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['search'] = this.search;
    data['slug'] = this.slug;
    data['reference'] = this.reference;
    data['location'] = this.location;
    data['logo'] = this.logo;
    data['type'] = this.type;
    data['postal_code'] = this.postalCode;
    data['job_advertiser'] = this.jobAdvertiser;
    data['application_url'] = this.applicationUrl;
    return data;
  }
}

class Seo {
  String? seoTitle;
  String? seoDescription;
  String? seoKeywords;
  String? seoOther;

  Seo({this.seoTitle, this.seoDescription, this.seoKeywords, this.seoOther});

  Seo.fromJson(Map<String, dynamic>? json) {
    seoTitle = json?['seo_title'];
    seoDescription = json?['seo_description'];
    seoKeywords = json?['seo_keywords'];
    seoOther = json?['seo_other'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seo_title'] = this.seoTitle;
    data['seo_description'] = this.seoDescription;
    data['seo_keywords'] = this.seoKeywords;
    data['seo_other'] = this.seoOther;
    return data;
  }
}
