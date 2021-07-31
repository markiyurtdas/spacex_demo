import 'package:appnation_spacex/model/fairings.dart';
import 'package:appnation_spacex/model/links.dart';

class Spacex {
  Fairings? fairings;
  late String name;
  late Links links;
  late String details;

  String? staticFireDateUtc;
  int? staticFireDateUnix;
  bool? tbd;
  bool? net;
  int? window;
  String? rocket;
  bool? success;
  List<String>? ships;
  List<String>? payloads;
  String? launchpad;
  bool? autoUpdate;
  String? launchLibraryId;
  int? flightNumber;
  String? dateUtc;
  int? dateUnix;
  String? dateLocal;
  String? datePrecision;
  bool? upcoming;
  String? id;

  Spacex(
      {Fairings? fairings,
        required Links links,
        required String name,
        required String details,
        String? staticFireDateUtc,
        int? staticFireDateUnix,
        bool? tbd,
        bool? net,
        int? window,
        String? rocket,
        bool? success,
        List<String>? ships,
        List<String>? payloads,
        String? launchpad,
        bool? autoUpdate,
        String? launchLibraryId,
        int? flightNumber,
        String? dateUtc,
        int? dateUnix,
        String? dateLocal,
        String? datePrecision,
        bool? upcoming,
        String? id}) {
    this.fairings = fairings;
    this.links = links;
    this.staticFireDateUtc = staticFireDateUtc;
    this.staticFireDateUnix = staticFireDateUnix;
    this.tbd = tbd;
    this.net = net;
    this.window = window;
    this.rocket = rocket;
    this.success = success;
    this.details = details;
    this.ships = ships;
    this.payloads = payloads;
    this.launchpad = launchpad;
    this.autoUpdate = autoUpdate;
    this.launchLibraryId = launchLibraryId;
    this.flightNumber = flightNumber;
    this.name = name;
    this.dateUtc = dateUtc;
    this.dateUnix = dateUnix;
    this.dateLocal = dateLocal;
    this.datePrecision = datePrecision;
    this.upcoming = upcoming;
    this.id = id;
  }


  Spacex.fromJson(Map<String, dynamic> json) {
    fairings = json['fairings'] != null
        ?  Fairings.fromJson(json['fairings'])
        : null;
    links = Links.fromJson(json['links']) ;
    staticFireDateUtc = json['static_fire_date_utc'];
    staticFireDateUnix = json['static_fire_date_unix'];
    tbd = json['tbd'];
    net = json['net'];
    window = json['window'];
    rocket = json['rocket'];
    success = json['success'];
    details = json['details'];
    ships = json['ships'].cast<String>();
    payloads = json['payloads'].cast<String>();
    launchpad = json['launchpad'];
    autoUpdate = json['auto_update'];
    launchLibraryId = json['launch_library_id'];
    flightNumber = json['flight_number'];
    name = json['name'];
    dateUtc = json['date_utc'];
    dateUnix = json['date_unix'];
    dateLocal = json['date_local'];
    datePrecision = json['date_precision'];
    upcoming = json['upcoming'];
    id = json['id'];
  }

}











