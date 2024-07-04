import 'package:dartz/dartz.dart';
import 'package:wecan/app/module/symptoms/data/models/symptoms_response_model.dart';

import '../../../../core/error/failure.dart';
import '../repositories/symptoms_repository.dart';

abstract interface class GetAllSymptomsUsecase {
  Future<Either<Failure, List<SymptomsResponseModel>>> call();
}

class GetAllSymptomsUsecaseImpl implements GetAllSymptomsUsecase {
  final SymptomsRepository repository;

  GetAllSymptomsUsecaseImpl(this.repository);

  @override
  Future<Either<Failure, List<SymptomsResponseModel>>> call() {
    return repository.getSymptoms();
  }
}
