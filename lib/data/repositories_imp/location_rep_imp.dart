import 'package:flutter_showcase_2/data/data_source/geolocator_location_data_source.dart';
import 'package:flutter_showcase_2/domain/entities/location.dart';
import 'package:flutter_showcase_2/domain/entities/setap_dependencies.dart';
import 'package:flutter_showcase_2/domain/repositories/location_rep.dart';

class LocationRepositoryImp implements LocationRepository {
  final GeoLocatorLocationDataSource _geoLocatorLocationDataSource =
      locator<GeoLocatorLocationDataSource>();

  @override
  Future<Location> getLocation() async {
    final position = await _geoLocatorLocationDataSource.getCurrentPosition();
    return Location(latitude: position.latitude, longitude: position.longitude);
  }
}
