class Geodata {
  String documentation;
  List<License> licenses;
  Rate rate;
  List<Result> results;
  Status status;
  StayInformed stayInformed;
  String thanks;
  Timestamp timestamp;
  int totalResults;

  Geodata({
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
}

class License {
  String name;
  String url;

  License({
    required this.name,
    required this.url,
  });
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
}

class Dms {
  String lat;
  String lng;

  Dms({
    required this.lat,
    required this.lng,
  });
}

class Mercator {
  double x;
  double y;

  Mercator({
    required this.x,
    required this.y,
  });
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
}

class Sun {
  Rise rise;
  Rise sunSet;

  Sun({
    required this.rise,
    required this.sunSet,
  });
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
}

class UnM49 {
  Regions regions;
  List<String> statisticalGroupings;

  UnM49({
    required this.regions,
    required this.statisticalGroupings,
  });
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
}

class What3Words {
  String words;

  What3Words({
    required this.words,
  });
}

class Bounds {
  Geometry northeast;
  Geometry southwest;

  Bounds({
    required this.northeast,
    required this.southwest,
  });
}

class Geometry {
  double lat;
  double lng;

  Geometry({
    required this.lat,
    required this.lng,
  });
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
}

class Status {
  int code;
  String message;

  Status({
    required this.code,
    required this.message,
  });
}

class StayInformed {
  String blog;
  String mastodon;

  StayInformed({
    required this.blog,
    required this.mastodon,
  });
}

class Timestamp {
  String createdHttp;
  int createdUnix;

  Timestamp({
    required this.createdHttp,
    required this.createdUnix,
  });
}
