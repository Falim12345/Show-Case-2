// To parse this JSON data, do
//
//     final geodataModel = geodataModelFromJson(jsonString);

import 'dart:convert';

GeodataModel geodataModelFromJson(String str) =>
    GeodataModel.fromJson(json.decode(str));

String geodataModelToJson(GeodataModel data) => json.encode(data.toJson());

class GeodataModel {
  String documentation;
  List<License> licenses;
  Rate rate;
  List<Result> results;
  Status status;
  StayInformed stayInformed;
  String thanks;
  Timestamp timestamp;
  int totalResults;

  GeodataModel({
    required this.documentation,
    required this.licenses,
    required this.rate,
    required this.results,
    required this.status,
    required this.stayInformed,
    required this.thanks,
    required this.timestamp,
    required this.totalResults,
  });

  factory GeodataModel.fromJson(Map<String, dynamic> json) => GeodataModel(
        documentation: json["documentation"],
        licenses: List<License>.from(
            json["licenses"].map((x) => License.fromJson(x))),
        rate: Rate.fromJson(json["rate"]),
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        status: Status.fromJson(json["status"]),
        stayInformed: StayInformed.fromJson(json["stay_informed"]),
        thanks: json["thanks"],
        timestamp: Timestamp.fromJson(json["timestamp"]),
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "documentation": documentation,
        "licenses": List<dynamic>.from(licenses.map((x) => x.toJson())),
        "rate": rate.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "status": status.toJson(),
        "stay_informed": stayInformed.toJson(),
        "thanks": thanks,
        "timestamp": timestamp.toJson(),
        "total_results": totalResults,
      };
}

class License {
  String name;
  String url;

  License({
    required this.name,
    required this.url,
  });

  factory License.fromJson(Map<String, dynamic> json) => License(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class Rate {
  int limit;
  int remaining;
  int reset;

  Rate({
    required this.limit,
    required this.remaining,
    required this.reset,
  });

  factory Rate.fromJson(Map<String, dynamic> json) => Rate(
        limit: json["limit"],
        remaining: json["remaining"],
        reset: json["reset"],
      );

  Map<String, dynamic> toJson() => {
        "limit": limit,
        "remaining": remaining,
        "reset": reset,
      };
}

class Result {
  Annotations annotations;
  Bounds bounds;
  Components components;
  int confidence;
  String formatted;
  Geometry geometry;

  Result({
    required this.annotations,
    required this.bounds,
    required this.components,
    required this.confidence,
    required this.formatted,
    required this.geometry,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        annotations: Annotations.fromJson(json["annotations"]),
        bounds: Bounds.fromJson(json["bounds"]),
        components: Components.fromJson(json["components"]),
        confidence: json["confidence"],
        formatted: json["formatted"],
        geometry: Geometry.fromJson(json["geometry"]),
      );

  Map<String, dynamic> toJson() => {
        "annotations": annotations.toJson(),
        "bounds": bounds.toJson(),
        "components": components.toJson(),
        "confidence": confidence,
        "formatted": formatted,
        "geometry": geometry.toJson(),
      };
}

class Annotations {
  Dms dms;
  String mgrs;
  String maidenhead;
  Mercator mercator;
  Osm osm;
  UnM49 unM49;
  int callingcode;
  Currency currency;
  String flag;
  String geohash;
  double qibla;
  Roadinfo roadinfo;
  Sun sun;
  Timezone timezone;
  What3Words what3Words;

  Annotations({
    required this.dms,
    required this.mgrs,
    required this.maidenhead,
    required this.mercator,
    required this.osm,
    required this.unM49,
    required this.callingcode,
    required this.currency,
    required this.flag,
    required this.geohash,
    required this.qibla,
    required this.roadinfo,
    required this.sun,
    required this.timezone,
    required this.what3Words,
  });

  factory Annotations.fromJson(Map<String, dynamic> json) => Annotations(
        dms: Dms.fromJson(json["DMS"]),
        mgrs: json["MGRS"],
        maidenhead: json["Maidenhead"],
        mercator: Mercator.fromJson(json["Mercator"]),
        osm: Osm.fromJson(json["OSM"]),
        unM49: UnM49.fromJson(json["UN_M49"]),
        callingcode: json["callingcode"],
        currency: Currency.fromJson(json["currency"]),
        flag: json["flag"],
        geohash: json["geohash"],
        qibla: json["qibla"]?.toDouble(),
        roadinfo: Roadinfo.fromJson(json["roadinfo"]),
        sun: Sun.fromJson(json["sun"]),
        timezone: Timezone.fromJson(json["timezone"]),
        what3Words: What3Words.fromJson(json["what3words"]),
      );

  Map<String, dynamic> toJson() => {
        "DMS": dms.toJson(),
        "MGRS": mgrs,
        "Maidenhead": maidenhead,
        "Mercator": mercator.toJson(),
        "OSM": osm.toJson(),
        "UN_M49": unM49.toJson(),
        "callingcode": callingcode,
        "currency": currency.toJson(),
        "flag": flag,
        "geohash": geohash,
        "qibla": qibla,
        "roadinfo": roadinfo.toJson(),
        "sun": sun.toJson(),
        "timezone": timezone.toJson(),
        "what3words": what3Words.toJson(),
      };
}

class Currency {
  List<dynamic> alternateSymbols;
  String decimalMark;
  String format;
  String htmlEntity;
  String isoCode;
  String isoNumeric;
  String name;
  int smallestDenomination;
  String subunit;
  int subunitToUnit;
  String symbol;
  int symbolFirst;
  String thousandsSeparator;

  Currency({
    required this.alternateSymbols,
    required this.decimalMark,
    required this.format,
    required this.htmlEntity,
    required this.isoCode,
    required this.isoNumeric,
    required this.name,
    required this.smallestDenomination,
    required this.subunit,
    required this.subunitToUnit,
    required this.symbol,
    required this.symbolFirst,
    required this.thousandsSeparator,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        alternateSymbols:
            List<dynamic>.from(json["alternate_symbols"].map((x) => x)),
        decimalMark: json["decimal_mark"],
        format: json["format"],
        htmlEntity: json["html_entity"],
        isoCode: json["iso_code"],
        isoNumeric: json["iso_numeric"],
        name: json["name"],
        smallestDenomination: json["smallest_denomination"],
        subunit: json["subunit"],
        subunitToUnit: json["subunit_to_unit"],
        symbol: json["symbol"],
        symbolFirst: json["symbol_first"],
        thousandsSeparator: json["thousands_separator"],
      );

  Map<String, dynamic> toJson() => {
        "alternate_symbols": List<dynamic>.from(alternateSymbols.map((x) => x)),
        "decimal_mark": decimalMark,
        "format": format,
        "html_entity": htmlEntity,
        "iso_code": isoCode,
        "iso_numeric": isoNumeric,
        "name": name,
        "smallest_denomination": smallestDenomination,
        "subunit": subunit,
        "subunit_to_unit": subunitToUnit,
        "symbol": symbol,
        "symbol_first": symbolFirst,
        "thousands_separator": thousandsSeparator,
      };
}

class Dms {
  String lat;
  String lng;

  Dms({
    required this.lat,
    required this.lng,
  });

  factory Dms.fromJson(Map<String, dynamic> json) => Dms(
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class Mercator {
  double x;
  double y;

  Mercator({
    required this.x,
    required this.y,
  });

  factory Mercator.fromJson(Map<String, dynamic> json) => Mercator(
        x: json["x"]?.toDouble(),
        y: json["y"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
      };
}

class Osm {
  String editUrl;
  String noteUrl;
  String url;

  Osm({
    required this.editUrl,
    required this.noteUrl,
    required this.url,
  });

  factory Osm.fromJson(Map<String, dynamic> json) => Osm(
        editUrl: json["edit_url"],
        noteUrl: json["note_url"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "edit_url": editUrl,
        "note_url": noteUrl,
        "url": url,
      };
}

class Roadinfo {
  String driveOn;
  String road;
  String speedIn;

  Roadinfo({
    required this.driveOn,
    required this.road,
    required this.speedIn,
  });

  factory Roadinfo.fromJson(Map<String, dynamic> json) => Roadinfo(
        driveOn: json["drive_on"],
        road: json["road"],
        speedIn: json["speed_in"],
      );

  Map<String, dynamic> toJson() => {
        "drive_on": driveOn,
        "road": road,
        "speed_in": speedIn,
      };
}

class Sun {
  Rise rise;
  Rise sunSet;

  Sun({
    required this.rise,
    required this.sunSet,
  });

  factory Sun.fromJson(Map<String, dynamic> json) => Sun(
        rise: Rise.fromJson(json["rise"]),
        sunSet: Rise.fromJson(json["set"]),
      );

  Map<String, dynamic> toJson() => {
        "rise": rise.toJson(),
        "set": sunSet.toJson(),
      };
}

class Rise {
  int apparent;
  int astronomical;
  int civil;
  int nautical;

  Rise({
    required this.apparent,
    required this.astronomical,
    required this.civil,
    required this.nautical,
  });

  factory Rise.fromJson(Map<String, dynamic> json) => Rise(
        apparent: json["apparent"],
        astronomical: json["astronomical"],
        civil: json["civil"],
        nautical: json["nautical"],
      );

  Map<String, dynamic> toJson() => {
        "apparent": apparent,
        "astronomical": astronomical,
        "civil": civil,
        "nautical": nautical,
      };
}

class Timezone {
  String name;
  int nowInDst;
  int offsetSec;
  String offsetString;
  String shortName;

  Timezone({
    required this.name,
    required this.nowInDst,
    required this.offsetSec,
    required this.offsetString,
    required this.shortName,
  });

  factory Timezone.fromJson(Map<String, dynamic> json) => Timezone(
        name: json["name"],
        nowInDst: json["now_in_dst"],
        offsetSec: json["offset_sec"],
        offsetString: json["offset_string"],
        shortName: json["short_name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "now_in_dst": nowInDst,
        "offset_sec": offsetSec,
        "offset_string": offsetString,
        "short_name": shortName,
      };
}

class UnM49 {
  Regions regions;
  List<String> statisticalGroupings;

  UnM49({
    required this.regions,
    required this.statisticalGroupings,
  });

  factory UnM49.fromJson(Map<String, dynamic> json) => UnM49(
        regions: Regions.fromJson(json["regions"]),
        statisticalGroupings:
            List<String>.from(json["statistical_groupings"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "regions": regions.toJson(),
        "statistical_groupings":
            List<dynamic>.from(statisticalGroupings.map((x) => x)),
      };
}

class Regions {
  String easternEurope;
  String europe;
  String ua;
  String world;

  Regions({
    required this.easternEurope,
    required this.europe,
    required this.ua,
    required this.world,
  });

  factory Regions.fromJson(Map<String, dynamic> json) => Regions(
        easternEurope: json["EASTERN_EUROPE"],
        europe: json["EUROPE"],
        ua: json["UA"],
        world: json["WORLD"],
      );

  Map<String, dynamic> toJson() => {
        "EASTERN_EUROPE": easternEurope,
        "EUROPE": europe,
        "UA": ua,
        "WORLD": world,
      };
}

class What3Words {
  String words;

  What3Words({
    required this.words,
  });

  factory What3Words.fromJson(Map<String, dynamic> json) => What3Words(
        words: json["words"],
      );

  Map<String, dynamic> toJson() => {
        "words": words,
      };
}

class Bounds {
  Geometry northeast;
  Geometry southwest;

  Bounds({
    required this.northeast,
    required this.southwest,
  });

  factory Bounds.fromJson(Map<String, dynamic> json) => Bounds(
        northeast: Geometry.fromJson(json["northeast"]),
        southwest: Geometry.fromJson(json["southwest"]),
      );

  Map<String, dynamic> toJson() => {
        "northeast": northeast.toJson(),
        "southwest": southwest.toJson(),
      };
}

class Geometry {
  double lat;
  double lng;

  Geometry({
    required this.lat,
    required this.lng,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class Components {
  String iso31661Alpha2;
  String iso31661Alpha3;
  List<String> iso31662;
  String category;
  String type;
  String borough;
  String city;
  String continent;
  String country;
  String countryCode;
  String district;
  String houseNumber;
  String municipality;
  String postcode;
  String road;
  String state;

  Components({
    required this.iso31661Alpha2,
    required this.iso31661Alpha3,
    required this.iso31662,
    required this.category,
    required this.type,
    required this.borough,
    required this.city,
    required this.continent,
    required this.country,
    required this.countryCode,
    required this.district,
    required this.houseNumber,
    required this.municipality,
    required this.postcode,
    required this.road,
    required this.state,
  });

  factory Components.fromJson(Map<String, dynamic> json) => Components(
        iso31661Alpha2: json["ISO_3166-1_alpha-2"],
        iso31661Alpha3: json["ISO_3166-1_alpha-3"],
        iso31662: List<String>.from(json["ISO_3166-2"].map((x) => x)),
        category: json["_category"],
        type: json["_type"],
        borough: json["borough"],
        city: json["city"],
        continent: json["continent"],
        country: json["country"],
        countryCode: json["country_code"],
        district: json["district"],
        houseNumber: json["house_number"],
        municipality: json["municipality"],
        postcode: json["postcode"],
        road: json["road"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "ISO_3166-1_alpha-2": iso31661Alpha2,
        "ISO_3166-1_alpha-3": iso31661Alpha3,
        "ISO_3166-2": List<dynamic>.from(iso31662.map((x) => x)),
        "_category": category,
        "_type": type,
        "borough": borough,
        "city": city,
        "continent": continent,
        "country": country,
        "country_code": countryCode,
        "district": district,
        "house_number": houseNumber,
        "municipality": municipality,
        "postcode": postcode,
        "road": road,
        "state": state,
      };
}

class Status {
  int code;
  String message;

  Status({
    required this.code,
    required this.message,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}

class StayInformed {
  String blog;
  String mastodon;

  StayInformed({
    required this.blog,
    required this.mastodon,
  });

  factory StayInformed.fromJson(Map<String, dynamic> json) => StayInformed(
        blog: json["blog"],
        mastodon: json["mastodon"],
      );

  Map<String, dynamic> toJson() => {
        "blog": blog,
        "mastodon": mastodon,
      };
}

class Timestamp {
  String createdHttp;
  int createdUnix;

  Timestamp({
    required this.createdHttp,
    required this.createdUnix,
  });

  factory Timestamp.fromJson(Map<String, dynamic> json) => Timestamp(
        createdHttp: json["created_http"],
        createdUnix: json["created_unix"],
      );

  Map<String, dynamic> toJson() => {
        "created_http": createdHttp,
        "created_unix": createdUnix,
      };
}
