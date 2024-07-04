import 'package:wecan/app/core/rest/rest_client.dart';
import 'package:wecan/app/module/symptoms/data/models/symptoms_response_model.dart';

import '../symptoms_datasource.dart';

class SymptomsDatasourceImp implements SymptomsDatasource {
  final RestClient restClient;

  SymptomsDatasourceImp({required this.restClient});

  @override
  Future<List<SymptomsResponseModel>> getSymptoms() async {
    var response = await restClient.get('https://60f1e82aa0984c0017dfae9f.mockapi.io/it/items');
    var data = Iterable.castFrom(response.data);

    return data.map((e) => SymptomsResponseModel.fromJson(e)).toList();
  }
}
