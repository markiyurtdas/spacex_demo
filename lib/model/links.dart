import 'package:appnation_spacex/model/flickr.dart';
import 'package:appnation_spacex/model/patch.dart';
import 'package:appnation_spacex/model/reddit.dart';

class Links {
  Patch? patch;
  Reddit? reddit;
  late Flickr flickr;
  String? webcast;
  String? youtubeId;


  Links(
      {Patch? patch,
        Reddit? reddit,
        required Flickr flickr,
        String? webcast,
        String? youtubeId}) {
    this.patch = patch;
    this.reddit = reddit;
    this.flickr = flickr;
    this.webcast = webcast;
    this.youtubeId = youtubeId;
  }


  Links.fromJson(Map<String, dynamic> json) {
    patch = json['patch'] != null ?  Patch.fromJson(json['patch']) : null;
    reddit =
    json['reddit'] != null ?  Reddit.fromJson(json['reddit']) : null;
    flickr =Flickr.fromJson(json['flickr']) ;
    webcast = json['webcast'];
    youtubeId = json['youtube_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.patch != null) {
      data['patch'] = this.patch!.toJson();
    }
    if (this.reddit != null) {
      data['reddit'] = this.reddit!.toJson();
    }
    if (this.flickr != null) {
      data['flickr'] = this.flickr.toJson();
    }
    data['webcast'] = this.webcast;
    data['youtube_id'] = this.youtubeId;
    return data;
  }
}