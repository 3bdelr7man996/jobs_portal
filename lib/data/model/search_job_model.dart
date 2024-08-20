class SearchJobModel {
  Jobs? jobs;
  Seo? seo;

  SearchJobModel({this.jobs, this.seo});

  SearchJobModel.fromJson(Map<String, dynamic>? json) {
    jobs = json?['jobs'] != null ? new Jobs.fromJson(json?['jobs']) : null;
    seo = json?['seo'] != null ? new Seo.fromJson(json?['seo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.jobs != null) {
      data['jobs'] = this.jobs!.toJson();
    }

    if (this.seo != null) {
      data['seo'] = this.seo!.toJson();
    }
    return data;
  }
}

class Jobs {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Jobs(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.path,
      this.perPage,
      this.to,
      this.total});

  Jobs.fromJson(Map<String, dynamic>? json) {
    currentPage = json?['current_page'];
    if (json?['data'] != null) {
      data = <Data>[];
      json?['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    firstPageUrl = json?['first_page_url'];
    from = json?['from'];
    lastPage = json?['last_page'];
    lastPageUrl = json?['last_page_url'];
    if (json?['links'] != null) {
      links = <Links>[];
      json?['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    path = json?['path'];
    perPage = json?['per_page'];
    to = json?['to'];
    total = json?['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Data {
  int? id;
  int? companyId;
  String? title;
  String? description;
  int? countryId;
  int? stateId;
  int? cityId;
  int? isFreelance;
  int? careerLevelId;
  int? salaryFrom;
  int? salaryTo;
  int? hideSalary;
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
  String? slug;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.companyId,
      this.title,
      this.description,
      this.countryId,
      this.stateId,
      this.cityId,
      this.isFreelance,
      this.careerLevelId,
      this.salaryFrom,
      this.salaryTo,
      this.hideSalary,
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
      this.slug,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    title = json['title'];
    description = json['description'];
    countryId = json['country_id'];
    stateId = json['state_id'];
    cityId = json['city_id'];
    isFreelance = json['is_freelance'];
    careerLevelId = json['career_level_id'];
    salaryFrom = json['salary_from'];
    salaryTo = json['salary_to'];
    hideSalary = json['hide_salary'];
    functionalAreaId = json['functional_area_id'];
    jobTypeId = json['job_type_id'];
    jobShiftId = json['job_shift_id'];
    numOfPositions = json['num_of_positions'];
    genderId = json['gender_id'];
    expiryDate = json['expiry_date'];
    degreeLevelId = json['degree_level_id'];
    jobExperienceId = json['job_experience_id'];
    isActive = json['is_active'];
    isFeatured = json['is_featured'];
    slug = json['slug'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['company_id'] = this.companyId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['country_id'] = this.countryId;
    data['state_id'] = this.stateId;
    data['city_id'] = this.cityId;
    data['is_freelance'] = this.isFreelance;
    data['career_level_id'] = this.careerLevelId;
    data['salary_from'] = this.salaryFrom;
    data['salary_to'] = this.salaryTo;
    data['hide_salary'] = this.hideSalary;
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
    data['slug'] = this.slug;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}

class Seo {
  int? id;
  String? pageTitle;
  String? seoTitle;
  String? seoDescription;
  String? seoKeywords;
  String? seoOther;

  Seo({
    this.id,
    this.pageTitle,
    this.seoTitle,
    this.seoDescription,
    this.seoKeywords,
    this.seoOther,
  });

  Seo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageTitle = json['page_title'];
    seoTitle = json['seo_title'];
    seoDescription = json['seo_description'];
    seoKeywords = json['seo_keywords'];
    seoOther = json['seo_other'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['page_title'] = this.pageTitle;
    data['seo_title'] = this.seoTitle;
    data['seo_description'] = this.seoDescription;
    data['seo_keywords'] = this.seoKeywords;
    data['seo_other'] = this.seoOther;

    return data;
  }
}
