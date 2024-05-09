// To parse this JSON data, do
//
//     final geodataModel = geodataModelFromJson(jsonString);

import 'dart:convert';

GeodataModel geodataModelFromJson(String str) =>
    GeodataModel.fromJson(json.decode(str) as Map<String, dynamic>);

String geodataModelToJson(GeodataModel data) => json.encode(data.toJson());

class GeodataModel {
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
        documentation: json['documentation'] as String,
        licenses: List<License>.from(
          json['licenses'].map(License.fromJson) as List<License>,
        ),
        rate: Rate.fromJson(json['rate'] as Map<String, dynamic>),
        results: List<Result>.from(
          json['results'].map(Result.fromJson) as List<Result>,
        ),
        status: Status.fromJson(json['status'] as Map<String, dynamic>),
        stayInformed: StayInformed.fromJson(
          json['stay_informed'] as Map<String, dynamic>,
        ),
        thanks: json['thanks'] as String,
        timestamp:
            Timestamp.fromJson(json['timestamp'] as Map<String, dynamic>),
        totalResults: json['total_results'] as int,
      );
  String documentation;
  List<License> licenses;
  Rate rate;
  List<Result> results;
  Status status;
  StayInformed stayInformed;
  String thanks;
  Timestamp timestamp;
  int totalResults;

  Map<String, dynamic> toJson() => {
        'documentation': documentation,
        'licenses': List<dynamic>.from(licenses.map((x) => x.toJson())),
        'rate': rate.toJson(),
        'results': List<dynamic>.from(results.map((x) => x.toJson())),
        'status': status.toJson(),
        'stay_informed': stayInformed.toJson(),
        'thanks': thanks,
        'timestamp': timestamp.toJson(),
        'total_results': totalResults,
      };
}

class License {
  License({
    required this.name,
    required this.url,
  });

  factory License.fromJson(Map<String, dynamic> json) => License(
        name: json['name'] as String,
        url: json['url'] as String,
      );
  String name;
  String url;

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
      };
}

class Rate {
  Rate({
    required this.limit,
    required this.remaining,
    required this.reset,
  });

  factory Rate.fromJson(Map<String, dynamic> json) => Rate(
        limit: json['limit'] as int,
        remaining: json['remaining'] as int,
        reset: json['reset'] as int,
      );
  int limit;
  int remaining;
  int reset;

  Map<String, dynamic> toJson() => {
        'limit': limit,
        'remaining': remaining,
        'reset': reset,
      };
}

class Result {
  Result({
    required this.annotations,
    required this.bounds,
    required this.components,
    required this.confidence,
    required this.formatted,
    required this.geometry,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        annotations:
            Annotations.fromJson(json['annotations'] as Map<String, dynamic>),
        bounds: Bounds.fromJson(json['bounds'] as Map<String, dynamic>),
        components:
            Components.fromJson(json['components'] as Map<String, dynamic>),
        confidence: json['confidence'] as int,
        formatted: json['formatted'] as String,
        geometry: Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
      );
  Annotations annotations;
  Bounds bounds;
  Components components;
  int confidence;
  String formatted;
  Geometry geometry;

  Map<String, dynamic> toJson() => {
        'annotations': annotations.toJson(),
        'bounds': bounds.toJson(),
        'components': components.toJson(),
        'confidence': confidence,
        'formatted': formatted,
        'geometry': geometry.toJson(),
      };
}

class Annotations {
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
        dms: Dms.fromJson(json['DMS'] as Map<String, dynamic>),
        mgrs: json['MGRS'] as String,
        maidenhead: json['Maidenhead'] as String,
        mercator: Mercator.fromJson(json['Mercator'] as Map<String, dynamic>),
        osm: Osm.fromJson(json['OSM'] as Map<String, dynamic>),
        unM49: UnM49.fromJson(json['UN_M49'] as Map<String, dynamic>),
        callingcode: json['callingcode'] as int,
        currency: Currency.fromJson(json['currency'] as Map<String, dynamic>),
        flag: json['flag'] as String,
        geohash: json['geohash'] as String,
        qibla: json['qibla'] as double,
        roadinfo: Roadinfo.fromJson(json['roadinfo'] as Map<String, dynamic>),
        sun: Sun.fromJson(json['sun'] as Map<String, dynamic>),
        timezone: Timezone.fromJson(json['timezone'] as Map<String, dynamic>),
        what3Words:
            What3Words.fromJson(json['what3words'] as Map<String, dynamic>),
      );
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

  Map<String, dynamic> toJson() => {
        'DMS': dms.toJson(),
        'MGRS': mgrs,
        'Maidenhead': maidenhead,
        'Mercator': mercator.toJson(),
        'OSM': osm.toJson(),
        'UN_M49': unM49.toJson(),
        'callingcode': callingcode,
        'currency': currency.toJson(),
        'flag': flag,
        'geohash': geohash,
        'qibla': qibla,
        'roadinfo': roadinfo.toJson(),
        'sun': sun.toJson(),
        'timezone': timezone.toJson(),
        'what3words': what3Words.toJson(),
      };
}

class Currency {
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
            List<dynamic>.from(json['alternate_symbols'].map((x) => x) as List),
        decimalMark: json['decimal_mark'] as String,
        format: json['format'] as String,
        htmlEntity: json['html_entity'] as String,
        isoCode: json['iso_code'] as String,
        isoNumeric: json['iso_numeric'] as String,
        name: json['name'] as String,
        smallestDenomination: json['smallest_denomination'] as int,
        subunit: json['subunit'] as String,
        subunitToUnit: json['subunit_to_unit'] as int,
        symbol: json['symbol'] as String,
        symbolFirst: json['symbol_first'] as int,
        thousandsSeparator: json['thousands_separator'] as String,
      );
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

  Map<String, dynamic> toJson() => {
        'alternate_symbols': List<dynamic>.from(alternateSymbols.map((x) => x)),
        'decimal_mark': decimalMark,
        'format': format,
        'html_entity': htmlEntity,
        'iso_code': isoCode,
        'iso_numeric': isoNumeric,
        'name': name,
        'smallest_denomination': smallestDenomination,
        'subunit': subunit,
        'subunit_to_unit': subunitToUnit,
        'symbol': symbol,
        'symbol_first': symbolFirst,
        'thousands_separator': thousandsSeparator,
      };
}

class Dms {
  Dms({
    required this.lat,
    required this.lng,
  });

  factory Dms.fromJson(Map<String, dynamic> json) => Dms(
        lat: json['lat'] as String,
        lng: json['lng'] as String,
      );
  String lat;
  String lng;

  Map<String, dynamic> toJson() => {
        'lat': lat,
        'lng': lng,
      };
}

class Mercator {
  Mercator({
    required this.x,
    required this.y,
  });

  factory Mercator.fromJson(Map<String, dynamic> json) => Mercator(
        x: json['x'] as double,
        y: json['y'] as double,
      );
  double x;
  double y;

  Map<String, dynamic> toJson() => {
        'x': x,
        'y': y,
      };
}

class Osm {
  Osm({
    required this.editUrl,
    required this.noteUrl,
    required this.url,
  });

  factory Osm.fromJson(Map<String, dynamic> json) => Osm(
        editUrl: json['edit_url'] as String,
        noteUrl: json['note_url'] as String,
        url: json['url'] as String,
      );
  String editUrl;
  String noteUrl;
  String url;

  Map<String, dynamic> toJson() => {
        'edit_url': editUrl,
        'note_url': noteUrl,
        'url': url,
      };
}

class Roadinfo {
  Roadinfo({
    required this.driveOn,
    required this.road,
    required this.speedIn,
  });

  factory Roadinfo.fromJson(Map<String, dynamic> json) => Roadinfo(
        driveOn: json['drive_on'] as String,
        road: json['road'] as String,
        speedIn: json['speed_in'] as String,
      );
  String driveOn;
  String road;
  String speedIn;

  Map<String, dynamic> toJson() => {
        'drive_on': driveOn,
        'road': road,
        'speed_in': speedIn,
      };
}

class Sun {
  Sun({
    required this.rise,
    required this.sunSet,
  });

  factory Sun.fromJson(Map<String, dynamic> json) => Sun(
        rise: Rise.fromJson(json['rise'] as Map<String, dynamic>),
        sunSet: Rise.fromJson(json['set'] as Map<String, dynamic>),
      );
  Rise rise;
  Rise sunSet;

  Map<String, dynamic> toJson() => {
        'rise': rise.toJson(),
        'set': sunSet.toJson(),
      };
}

class Rise {
  Rise({
    required this.apparent,
    required this.astronomical,
    required this.civil,
    required this.nautical,
  });

  factory Rise.fromJson(Map<String, dynamic> json) => Rise(
        apparent: json['apparent'] as int,
        astronomical: json['astronomical'] as int,
        civil: json['civil'] as int,
        nautical: json['nautical'] as int,
      );
  int apparent;
  int astronomical;
  int civil;
  int nautical;

  Map<String, dynamic> toJson() => {
        'apparent': apparent,
        'astronomical': astronomical,
        'civil': civil,
        'nautical': nautical,
      };
}

class Timezone {
  Timezone({
    required this.name,
    required this.nowInDst,
    required this.offsetSec,
    required this.offsetString,
    required this.shortName,
  });

  factory Timezone.fromJson(Map<String, dynamic> json) => Timezone(
        name: json['name'] as String,
        nowInDst: json['now_in_dst'] as int,
        offsetSec: json['offset_sec'] as int,
        offsetString: json['offset_string'] as String,
        shortName: json['short_name'] as String,
      );
  String name;
  int nowInDst;
  int offsetSec;
  String offsetString;
  String shortName;

  Map<String, dynamic> toJson() => {
        'name': name,
        'now_in_dst': nowInDst,
        'offset_sec': offsetSec,
        'offset_string': offsetString,
        'short_name': shortName,
      };
}

class UnM49 {
  UnM49({
    required this.regions,
    required this.statisticalGroupings,
  });

  factory UnM49.fromJson(Map<String, dynamic> json) => UnM49(
        regions: Regions.fromJson(json['regions'] as Map<String, dynamic>),
        statisticalGroupings: List<String>.from(
          json['statistical_groupings'].map((x) => x) as List<dynamic>,
        ),
      );
  Regions regions;
  List<String> statisticalGroupings;

  Map<String, dynamic> toJson() => {
        'regions': regions.toJson(),
        'statistical_groupings':
            List<dynamic>.from(statisticalGroupings.map((x) => x)),
      };
}

class Regions {
  Regions({
    required this.easternEurope,
    required this.europe,
    required this.ua,
    required this.world,
  });

  factory Regions.fromJson(Map<String, dynamic> json) => Regions(
        easternEurope: json['EASTERN_EUROPE'] as String,
        europe: json['EUROPE'] as String,
        ua: json['UA'] as String,
        world: json['WORLD'] as String,
      );
  String easternEurope;
  String europe;
  String ua;
  String world;

  Map<String, dynamic> toJson() => {
        'EASTERN_EUROPE': easternEurope,
        'EUROPE': europe,
        'UA': ua,
        'WORLD': world,
      };
}

class What3Words {
  What3Words({
    required this.words,
  });

  factory What3Words.fromJson(Map<String, dynamic> json) => What3Words(
        words: json['words'] as String,
      );
  String words;

  Map<String, dynamic> toJson() => {
        'words': words,
      };
}

class Bounds {
  Bounds({
    required this.northeast,
    required this.southwest,
  });

  factory Bounds.fromJson(Map<String, dynamic> json) => Bounds(
        northeast: Geometry.fromJson(json['northeast'] as Map<String, dynamic>),
        southwest: Geometry.fromJson(json['southwest'] as Map<String, dynamic>),
      );
  Geometry northeast;
  Geometry southwest;

  Map<String, dynamic> toJson() => {
        'northeast': northeast.toJson(),
        'southwest': southwest.toJson(),
      };
}

class Geometry {
  Geometry({
    required this.lat,
    required this.lng,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        lat: json['lat'] as double,
        lng: json['lng'] as double,
      );
  double lat;
  double lng;

  Map<String, dynamic> toJson() => {
        'lat': lat,
        'lng': lng,
      };
}

class Components {
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
        iso31661Alpha2: json['ISO_3166-1_alpha-2'] as String,
        iso31661Alpha3: json['ISO_3166-1_alpha-3'] as String,
        iso31662: List<String>.from(json['ISO_3166-2'].map((x) => x) as List),
        category: json['_category'] as String,
        type: json['_type'] as String,
        borough: json['borough'] as String,
        city: json['city'] as String,
        continent: json['continent'] as String,
        country: json['country'] as String,
        countryCode: json['country_code'] as String,
        district: json['district'] as String,
        houseNumber: json['house_number'] as String,
        municipality: json['municipality'] as String,
        postcode: json['postcode'] as String,
        road: json['road'] as String,
        state: json['state'] as String,
      );
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

  Map<String, dynamic> toJson() => {
        'ISO_3166-1_alpha-2': iso31661Alpha2,
        'ISO_3166-1_alpha-3': iso31661Alpha3,
        'ISO_3166-2': List<dynamic>.from(iso31662.map((x) => x)),
        '_category': category,
        '_type': type,
        'borough': borough,
        'city': city,
        'continent': continent,
        'country': country,
        'country_code': countryCode,
        'district': district,
        'house_number': houseNumber,
        'municipality': municipality,
        'postcode': postcode,
        'road': road,
        'state': state,
      };
}

class Status {
  Status({
    required this.code,
    required this.message,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        code: json['code'] as int,
        message: json['message'] as String,
      );
  int code;
  String message;

  Map<String, dynamic> toJson() => {
        'code': code,
        'message': message,
      };
}

class StayInformed {
  StayInformed({
    required this.blog,
    required this.mastodon,
  });

  factory StayInformed.fromJson(Map<String, dynamic> json) => StayInformed(
        blog: json['blog'] as String,
        mastodon: json['mastodon'] as String,
      );
  String blog;
  String mastodon;

  Map<String, dynamic> toJson() => {
        'blog': blog,
        'mastodon': mastodon,
      };
}

class Timestamp {
  Timestamp({
    required this.createdHttp,
    required this.createdUnix,
  });

  factory Timestamp.fromJson(Map<String, dynamic> json) => Timestamp(
        createdHttp: json['created_http'] as String,
        createdUnix: json['created_unix'] as int,
      );
  String createdHttp;
  int createdUnix;

  Map<String, dynamic> toJson() => {
        'created_http': createdHttp,
        'created_unix': createdUnix,
      };
}
