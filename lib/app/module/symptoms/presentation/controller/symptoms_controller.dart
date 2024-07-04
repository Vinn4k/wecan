import 'package:flutter/material.dart';

import '../../data/models/symptoms_response_model.dart';
import '../../domain/usecase/get_all_symptoms.dart';

class SymptomsController extends ChangeNotifier {
  final GetAllSymptomsUsecase _getAllSymptomsUsecase;

  SymptomsController({required GetAllSymptomsUsecase getAllSymptomsUsecase})
      : _getAllSymptomsUsecase = getAllSymptomsUsecase;

  void init() async {
    getSymptoms();
  }

  var loading = ValueNotifier(true);
  var message = "";
  late List<SymptomsResponseModel> symptoms;

  Future<void> getSymptoms() async {
    var response = await _getAllSymptomsUsecase.call();
    response.fold((l) {
      message = l.message;
      debugPrint("$l");
    }, (r) {
      symptoms = r;
    });
    loading.value = false;
    notifyListeners();
  }
}
