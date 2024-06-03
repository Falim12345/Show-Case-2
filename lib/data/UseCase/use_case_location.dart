import 'package:flutter_showcase_2/data/repositories_imp/location_rep_imp.dart';
import 'package:flutter_showcase_2/domain/entities/location.dart';
import 'package:get_it/get_it.dart';

import '../../domain/UseCase/use_case.dart';

class GetLocationUseCase extends UseCase<Location, void> {
  GetLocationUseCase() : _locationRepository = GetIt.I<LocationRepositoryImp>();
  final LocationRepositoryImp _locationRepository;

  @override
  Future<Location> call(params) {
    return _locationRepository.getLocation();
  }
}
