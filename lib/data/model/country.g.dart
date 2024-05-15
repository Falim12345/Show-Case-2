// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      json['name'] == null
          ? null
          : Name.fromJson(json['name'] as Map<String, dynamic>),
      json['flags'] == null
          ? null
          : Flags.fromJson(json['flags'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'name': instance.name,
      'flags': instance.flags,
    };

Flags _$FlagsFromJson(Map<String, dynamic> json) => Flags(
      json['svg'] as String?,
      json['png'] as String?,
    )..alt = json['alt'] as String?;

Map<String, dynamic> _$FlagsToJson(Flags instance) => <String, dynamic>{
      'svg': instance.svg,
      'png': instance.png,
      'alt': instance.alt,
    };

Name _$NameFromJson(Map<String, dynamic> json) => Name(
      json['common'] as String?,
      json['official'] as String?,
    );

Map<String, dynamic> _$NameToJson(Name instance) => <String, dynamic>{
      'common': instance.common,
      'official': instance.official,
    };
