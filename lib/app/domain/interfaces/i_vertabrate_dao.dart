import '../entities/vertebrate.dart';

abstract class IVertabrateDao {
  Future<List<Vertebrate>> find();
  Future<void> save(Vertebrate subject);
  Future<void> remove(dynamic id);
}
