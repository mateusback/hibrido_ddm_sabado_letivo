import 'package:get_it/get_it.dart';
import 'package:hibrido_ddm_sabado_letivo/app/domain/entities/vertebrate.dart';
import 'package:hibrido_ddm_sabado_letivo/app/domain/interfaces/i_vertabrate_dao.dart';
import 'package:hibrido_ddm_sabado_letivo/app/domain/services/i_vertebrate_service.dart';

class VertebrateService implements IVertebrateService {
  var _vertebrateDao = GetIt.I.get<IVertabrateDao>();

  VertebrateService();

  @override
  Future<List<Vertebrate>> find() async {
    return _vertebrateDao.find();
  }

  @override
  Future<void> save(Vertebrate vertebrate) async {
    await _vertebrateDao.save(vertebrate);
  }

  @override
  Future<void> remove(dynamic vertebrateId) async {
    await _vertebrateDao.remove(vertebrateId);
  }
}
