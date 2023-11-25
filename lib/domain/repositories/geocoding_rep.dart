import 'package:dartz/dartz.dart';
import 'package:flutter_showcase_2/core/error/failure.dart';
import 'package:flutter_showcase_2/data/model/geodata_model.dart';

abstract class GeocoderRepository {
  Future<Either<Failure, GeodataModel>> getCoutryCode();
}
