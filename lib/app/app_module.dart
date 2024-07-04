import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wecan/app/core/rest/dio/dio_rest_client.dart';
import 'package:wecan/app/core/rest/rest_client.dart';

import 'module/symptoms/symptoms_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {}
  @override
  void exportedBinds(Injector i) {
    i.add(Dio.new);
    i.add<RestClient>(DioRestClient.new);
    super.exportedBinds(i);
  }

  @override
  void routes(r) {
    r.module('/', module: SymptomsModule());
  }
}
