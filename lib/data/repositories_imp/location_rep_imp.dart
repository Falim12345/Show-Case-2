import 'package:flutter_showcase_2/data/data_source/locator_location_data_source_imp.dart';
import 'package:flutter_showcase_2/domain/entities/location.dart';
import 'package:flutter_showcase_2/core/setap_dependencies.dart';
import 'package:flutter_showcase_2/domain/repositories/location_rep.dart';

class LocationRepositoryImp implements LocationRepository {
  final LocatorLocationDataSource _geoLocatorLocationDataSource =
      locator<LocatorLocationDataSource>();

  @override
  Future<Location> getLocation() async {
    final position = await _geoLocatorLocationDataSource.getCurrentPosition();
    return Location(latitude: position.latitude, longitude: position.longitude);
  }
}
