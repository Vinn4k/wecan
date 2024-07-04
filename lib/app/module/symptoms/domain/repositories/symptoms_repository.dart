import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/models/symptoms_response_model.dart';

abstract interface class SymptomsRepository {
  Future<Either<Failure, List<SymptomsResponseModel>>> getSymptoms();
}
