import 'package:json_annotation/json_annotation.dart';

part 'country.g.dart';

@JsonSerializable()
class Country {
  Country(this.commonName, this.officialName, this.flags);

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
  String commonName;
  String officialName;
  Flags flags;

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}

@JsonSerializable()
class Flags {
  Flags(this.svg, this.png);

  factory Flags.fromJson(Map<String, dynamic> json) => _$FlagsFromJson(json);
  String svg;
  String png;

  Map<String, dynamic> toJson() => _$FlagsToJson(this);
}
