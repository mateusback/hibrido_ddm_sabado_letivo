import 'package:get_it/get_it.dart';
import 'package:hibrido_ddm_sabado_letivo/app/domain/entities/vertebrate.dart';
import 'package:hibrido_ddm_sabado_letivo/app/domain/interfaces/i_vertabrate_dao.dart';
import 'package:hibrido_ddm_sabado_letivo/app/domain/services/i_vertebrate_service.dart';
import 'package:hibrido_ddm_sabado_letivo/app/domain/services/vertebrate_service.dart';
import 'package:hibrido_ddm_sabado_letivo/app/sql/vertebrate_dao.dart';

setupInjection() async {
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<IVertabrateDao>(VertebrateDao());
  getIt.registerSingleton<IVertebrateService>(VertebrateService());
}
