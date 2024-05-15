import 'package:json_annotation/json_annotation.dart';

part 'country.g.dart';

@JsonSerializable()
class Country {
  Country(this.name, this.flags);

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
  Name? name;
  Flags? flags;

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}

@JsonSerializable()
class Flags {
  Flags(this.svg, this.png);

  factory Flags.fromJson(Map<String, dynamic> json) => _$FlagsFromJson(json);
  String? svg;
  String? png;
  String? alt;
  Map<String, dynamic> toJson() => _$FlagsToJson(this);
}

@JsonSerializable()
class Name {
  Name(this.common, this.official);

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);

  String? common;
  String? official;

  Map<String, dynamic> toJson() => _$NameToJson(this);
}
