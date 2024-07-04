import 'package:flutter_modular/flutter_modular.dart';
import 'package:wecan/app/app_module.dart';
import 'package:wecan/app/module/symptoms/data/datasource/remote/symptoms_datasource_imp.dart';
import 'package:wecan/app/module/symptoms/data/repositories/symptoms_repository_imp.dart';
import 'package:wecan/app/module/symptoms/domain/usecase/get_all_symptoms.dart';
import 'package:wecan/app/module/symptoms/presentation/controller/symptoms_controller.dart';
import 'package:wecan/app/module/symptoms/presentation/pages/symptoms_page.dart';

import 'data/datasource/symptoms_datasource.dart';
import 'domain/repositories/symptoms_repository.dart';

class SymptomsModule extends Module {
  @override
  void binds(i) {
    i.add<SymptomsDatasource>(SymptomsDatasourceImp.new);
    i.add<SymptomsRepository>(SymptomsRepositoryImp.new);
    i.add<GetAllSymptomsUsecase>(GetAllSymptomsUsecaseImpl.new);
    i.add<SymptomsController>(SymptomsController.new);
  }

  @override
  List<Module> get imports => [
        AppModule(),
      ];

  @override
  void routes(r) {
    r.child('/',
        child: (context) => SymptomsPage(
              controller: Modular.get<SymptomsController>()..init(),
            ));
  }
}
