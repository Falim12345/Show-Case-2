import 'package:geolocator/geolocator.dart';

abstract class LocationDataSourse {
  Future<Position> getCurrentPosition();
}
