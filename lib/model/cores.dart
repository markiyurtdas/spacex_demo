class Cores {
  String? core;
  int? flight;
  bool? gridfins;
  bool? legs;
  bool? reused;
  bool? landingAttempt;
  bool? landingSuccess;
  String? landingType;
  String? landpad;

  Cores(
      {String? core,
        int? flight,
        bool? gridfins,
        bool? legs,
        bool? reused,
        bool? landingAttempt,
        bool? landingSuccess,
        String? landingType,
        String? landpad}) {
    this.core = core;
    this.flight = flight;
    this.gridfins = gridfins;
    this.legs = legs;
    this.reused = reused;
    this.landingAttempt = landingAttempt;
    this.landingSuccess = landingSuccess;
    this.landingType = landingType;
    this.landpad = landpad;
  }

  Cores.fromJson(Map<String, dynamic> json) {
    core = json['core'];
    flight = json['flight'];
    gridfins = json['gridfins'];
    legs = json['legs'];
    reused = json['reused'];
    landingAttempt = json['landing_attempt'];
    landingSuccess = json['landing_success'];
    landingType = json['landing_type'];
    landpad = json['landpad'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['core'] = this.core;
    data['flight'] = this.flight;
    data['gridfins'] = this.gridfins;
    data['legs'] = this.legs;
    data['reused'] = this.reused;
    data['landing_attempt'] = this.landingAttempt;
    data['landing_success'] = this.landingSuccess;
    data['landing_type'] = this.landingType;
    data['landpad'] = this.landpad;
    return data;
  }

}