class Geodata {
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
  String documentation;
  List<License> licenses;
  Rate rate;
  List<Result> results;
  Status status;
  StayInformed stayInformed;
  String thanks;
  Timestamp timestamp;
  int totalResults;
}

class License {
  License({
    required this.name,
    required this.url,
  });
  String name;
  String url;
}

class Rate {
  Rate({
    required this.limit,
    required this.remaining,
    required this.reset,
  });
  int limit;
  int remaining;
  int reset;
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
  Annotations annotations;
  Bounds bounds;
  Components components;
  int confidence;
  String formatted;
  Geometry geometry;
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
}

class Dms {
  Dms({
    required this.lat,
    required this.lng,
  });
  String lat;
  String lng;
}

class Mercator {
  Mercator({
    required this.x,
    required this.y,
  });
  double x;
  double y;
}

class Osm {
  Osm({
    required this.editUrl,
    required this.noteUrl,
    required this.url,
  });
  String editUrl;
  String noteUrl;
  String url;
}

class Roadinfo {
  Roadinfo({
    required this.driveOn,
    required this.road,
    required this.speedIn,
  });
  String driveOn;
  String road;
  String speedIn;
}

class Sun {
  Sun({
    required this.rise,
    required this.sunSet,
  });
  Rise rise;
  Rise sunSet;
}

class Rise {
  Rise({
    required this.apparent,
    required this.astronomical,
    required this.civil,
    required this.nautical,
  });
  int apparent;
  int astronomical;
  int civil;
  int nautical;
}

class Timezone {
  Timezone({
    required this.name,
    required this.nowInDst,
    required this.offsetSec,
    required this.offsetString,
    required this.shortName,
  });
  String name;
  int nowInDst;
  int offsetSec;
  String offsetString;
  String shortName;
}

class UnM49 {
  UnM49({
    required this.regions,
    required this.statisticalGroupings,
  });
  Regions regions;
  List<String> statisticalGroupings;
}

class Regions {
  Regions({
    required this.easternEurope,
    required this.europe,
    required this.ua,
    required this.world,
  });
  String easternEurope;
  String europe;
  String ua;
  String world;
}

class What3Words {
  What3Words({
    required this.words,
  });
  String words;
}

class Bounds {
  Bounds({
    required this.northeast,
    required this.southwest,
  });
  Geometry northeast;
  Geometry southwest;
}

class Geometry {
  Geometry({
    required this.lat,
    required this.lng,
  });
  double lat;
  double lng;
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
}

class Status {
  Status({
    required this.code,
    required this.message,
  });
  int code;
  String message;
}

class StayInformed {
  StayInformed({
    required this.blog,
    required this.mastodon,
  });
  String blog;
  String mastodon;
}

class Timestamp {
  Timestamp({
    required this.createdHttp,
    required this.createdUnix,
  });
  String createdHttp;
  int createdUnix;
}
