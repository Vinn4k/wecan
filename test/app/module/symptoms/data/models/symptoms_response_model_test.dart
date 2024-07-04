import 'package:flutter_test/flutter_test.dart';
import 'package:wecan/app/module/symptoms/data/models/symptoms_response_model.dart';

void main() {
  test('SymptomsModel map  json', () {
    final List<SymptomsResponseModel> symptoms = _json.map((e) => SymptomsResponseModel.fromJson(e)).toList();
    expect(symptoms[0], isA<SymptomsResponseModel>());
  });
}

var _json = [
  {"name": "violet", "id": "1"},
  {"name": "mint green", "id": "2"},
  {"name": "white", "id": "3"}
];
