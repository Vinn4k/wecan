import '../models/symptoms_response_model.dart';

abstract interface class SymptomsDatasource {
  Future<List<SymptomsResponseModel>> getSymptoms();
}
