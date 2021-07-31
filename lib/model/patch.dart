class Patch {
  String? small;
  String? large;

  Patch({String? small, String? large}) {
    this.small = small;
    this.large = large;
  }

  Patch.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['small'] = this.small;
    data['large'] = this.large;
    return data;
  }
}