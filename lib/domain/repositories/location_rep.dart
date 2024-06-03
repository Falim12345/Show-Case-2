import 'package:flutter_showcase_2/domain/entities/location.dart';

abstract class LocationRepository {
  Future<Location> getLocation();
}
