class Reddit {
  String? campaign;
  String? launch;
  String? recovery;

  Reddit({String? campaign, String? launch, String? recovery}) {
    this.campaign = campaign;
    this.launch = launch;
    this.recovery = recovery;
  }

  Reddit.fromJson(Map<String, dynamic> json) {
    campaign = json['campaign'];
    launch = json['launch'];
    recovery = json['recovery'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['campaign'] = this.campaign;
    data['launch'] = this.launch;
    data['recovery'] = this.recovery;
    return data;
  }
}