class Fairings {
  bool? reused;
  bool? recoveryAttempt;
  bool? recovered;
  List<String>? ships;

  Fairings(
      {bool? reused, bool? recoveryAttempt, bool? recovered, List<String>? ships}) {
    this.reused = reused;
    this.recoveryAttempt = recoveryAttempt;
    this.recovered = recovered;
    this.ships = ships;
  }
  Fairings.fromJson(Map<String, dynamic> json) {
    reused = json['reused'];
    recoveryAttempt = json['recovery_attempt'];
    recovered = json['recovered'];
    ships = json['ships'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['reused'] = this.reused;
    data['recovery_attempt'] = this.recoveryAttempt;
    data['recovered'] = this.recovered;
    data['ships'] = this.ships;
    return data;
  }
}