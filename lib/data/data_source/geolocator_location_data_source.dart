import 'package:geolocator/geolocator.dart';

class GeoLocatorLocationDataSource {
  Future<Position> getCurrentPosition() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
