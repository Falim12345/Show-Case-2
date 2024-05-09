import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Country {
  Country({
    required this.name,
    required this.flag,
  });
  final String name;
  final String flag;
}
