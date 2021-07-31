class Flickr {
  late List<String> original;
  Flickr({ required List<String> original}) {
    this.original = original;
  }

  Flickr.fromJson(Map<String, dynamic> json) {
    original = json['original'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['original'] = this.original;
    return data;
  }
}