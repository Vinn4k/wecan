import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wecan/app/core/rest/rest_client.dart';
import 'package:wecan/app/core/rest/rest_client_response.dart';
import 'package:wecan/app/module/symptoms/data/datasource/remote/symptoms_datasource_imp.dart';
import 'package:wecan/app/module/symptoms/data/models/symptoms_response_model.dart';

class MockRestClient extends Mock implements RestClient {}

void main() {
  late SymptomsDatasourceImp datasource;
  late RestClient restClient;

  setUp(() {
    restClient = MockRestClient();
    datasource = SymptomsDatasourceImp(restClient: restClient);
  });

  test('getSymptoms returns a list of SymptomsResponseModel', () async {
    final mockResponse = [
      {
        'id': '1',
        'name': 'Symptom 1',
      },
      {
        'id': '2',
        'name': 'Symptom 2',
      },
    ];
    when(() => restClient.get(any())).thenAnswer((_) async => RestClientResponse(data: mockResponse, statusCode: 200));

    final result = await datasource.getSymptoms();

    expect(result, isA<List<SymptomsResponseModel>>());
    expect(result.length, 2);
    expect(result[0].id, 1);
  });
}
