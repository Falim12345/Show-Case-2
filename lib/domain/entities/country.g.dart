// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      json['commonName'] as String,
      json['officialName'] as String,
      Flags.fromJson(json['flags'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'commonName': instance.commonName,
      'officialName': instance.officialName,
      'flags': instance.flags,
    };

Flags _$FlagsFromJson(Map<String, dynamic> json) => Flags(
      json['svg'] as String,
      json['png'] as String,
    );

Map<String, dynamic> _$FlagsToJson(Flags instance) => <String, dynamic>{
      'svg': instance.svg,
      'png': instance.png,
    };
