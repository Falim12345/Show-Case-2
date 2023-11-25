import 'package:flutter_showcase_2/data/repositories_imp/location_rep_imp.dart';
import 'package:flutter_showcase_2/domain/entities/location.dart';
import 'package:flutter_showcase_2/core/setap_dependencies.dart';
import 'package:get_it/get_it.dart';

import '../../domain/UseCase/use_case.dart';

class GetLocationUseCase extends UseCase<Location, void> {
  final LocationRepositoryImp _locationRepository;

  GetLocationUseCase() : _locationRepository = GetIt.I<LocationRepositoryImp>();

  @override
  Future<Location> call(params) async {
    return await _locationRepository.getLocation();
  }
}
