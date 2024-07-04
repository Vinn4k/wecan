import '../../../../core/error/failure.dart';
import '../../domain/repositories/symptoms_repository.dart';
import '../datasource/symptoms_datasource.dart';
import 'package:dartz/dartz.dart';

import '../models/symptoms_response_model.dart';

class SymptomsRepositoryImp implements SymptomsRepository {
  final SymptomsDatasource remoteDataSource;

  SymptomsRepositoryImp({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<SymptomsResponseModel>>> getSymptoms() async {
    try {
      final symptoms = await remoteDataSource.getSymptoms();
      return Right(symptoms);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(UnhandledFailure(data: e));
    }
  }
}
