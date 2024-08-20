class AppConfigurationModel {
  List<Configuration>? genders;
  List<Configuration>? maritalStatuses;
  List<Configuration>? nationalities;
  List<Configuration>? countries;
  List<Configuration>? jobExperiences;
  List<Configuration>? careerLevels;
  List<Configuration>? industries;
  List<Configuration>? functionalAreas;

  AppConfigurationModel(
      {this.genders,
      this.maritalStatuses,
      this.nationalities,
      this.countries,
      this.jobExperiences,
      this.careerLevels,
      this.industries,
      this.functionalAreas});

  AppConfigurationModel.fromJson(Map<String, dynamic>? json) {
    if (json?['genders'] != null) {
      genders = <Configuration>[];
      json?['genders'].forEach((v) {
        genders!.add(Configuration.fromJson(v));
      });
    }
    if (json?['maritalStatuses'] != null) {
      maritalStatuses = <Configuration>[];
      json?['maritalStatuses'].forEach((v) {
        maritalStatuses!.add(Configuration.fromJson(v));
      });
    }
    if (json?['nationalities'] != null) {
      nationalities = <Configuration>[];
      json?['nationalities'].forEach((v) {
        nationalities!.add(Configuration.fromJson(v));
      });
    }
    if (json?['countries'] != null) {
      countries = <Configuration>[];
      json?['countries'].forEach((v) {
        countries!.add(Configuration.fromJson(v));
      });
    }
    if (json?['jobExperiences'] != null) {
      jobExperiences = <Configuration>[];
      json?['jobExperiences'].forEach((v) {
        jobExperiences!.add(Configuration.fromJson(v));
      });
    }
    if (json?['careerLevels'] != null) {
      careerLevels = <Configuration>[];
      json?['careerLevels'].forEach((v) {
        careerLevels!.add(Configuration.fromJson(v));
      });
    }
    if (json?['industries'] != null) {
      industries = <Configuration>[];
      json?['industries'].forEach((v) {
        industries!.add(Configuration.fromJson(v));
      });
    }
    if (json?['functionalAreas'] != null) {
      functionalAreas = <Configuration>[];
      json?['functionalAreas'].forEach((v) {
        functionalAreas!.add(Configuration.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.genders != null) {
      data['genders'] = this.genders!.map((v) => v.toJson()).toList();
    }
    if (this.maritalStatuses != null) {
      data['maritalStatuses'] =
          this.maritalStatuses!.map((v) => v.toJson()).toList();
    }
    if (this.nationalities != null) {
      data['nationalities'] =
          this.nationalities!.map((v) => v.toJson()).toList();
    }
    if (this.countries != null) {
      data['countries'] = this.countries!.map((v) => v.toJson()).toList();
    }
    if (this.jobExperiences != null) {
      data['jobExperiences'] =
          this.jobExperiences!.map((v) => v.toJson()).toList();
    }
    if (this.careerLevels != null) {
      data['careerLevels'] = this.careerLevels!.map((v) => v.toJson()).toList();
    }
    if (this.industries != null) {
      data['industries'] = this.industries!.map((v) => v.toJson()).toList();
    }
    if (this.functionalAreas != null) {
      data['functionalAreas'] =
          this.functionalAreas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Configuration {
  int? id;
  String? name;

  Configuration({this.id, this.name});

  Configuration.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
