import 'package:hibrido_ddm_sabado_letivo/app/domain/entities/Vertebrate.dart';

abstract class IVertabrateDao {
  Future<List<Vertebrate>> find();
  Future<void> save(Vertebrate subject);
  Future<void> remove(dynamic id);
}
