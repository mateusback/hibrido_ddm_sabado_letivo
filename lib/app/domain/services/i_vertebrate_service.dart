import 'package:hibrido_ddm_sabado_letivo/app/domain/entities/vertebrate.dart';

abstract class IVertebrateService {
  Future<List<Vertebrate>> find();

  Future<void> save(Vertebrate vertebrate);

  Future<void> remove(dynamic vertebrateId);
}
