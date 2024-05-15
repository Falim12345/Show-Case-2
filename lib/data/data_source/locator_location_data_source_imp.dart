import 'package:flutter_showcase_2/domain/interfaces/location_data_sourse.dart';
import 'package:geolocator/geolocator.dart';

class LocatorLocationDataSource implements LocationDataSourse {
  @override
  Future<Position> getCurrentPosition() async {
    return Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}
