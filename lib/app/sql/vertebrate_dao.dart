import 'package:hibrido_ddm_sabado_letivo/app/domain/entities/vertebrate.dart';
import 'package:hibrido_ddm_sabado_letivo/app/domain/interfaces/i_vertabrate_dao.dart';
import 'package:hibrido_ddm_sabado_letivo/app/domain/services/i_vertebrate_service.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class VertebrateDao implements IVertabrateDao {
  late Database _database;

  Future<void> _initDatabase() async {
    // Obtém o caminho do banco de dados
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'vertebrate.db');

    // Abre o banco de dados e cria a tabela se não existir
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE vertebrates(id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT, idade INTEGER, especie TEXT, tipoColunaVertebral TEXT)',
        );
      },
    );
  }

  @override
  Future<List<Vertebrate>> find() async {
    await _initDatabase();
    final List<Map<String, dynamic>> maps =
        await _database.query('vertebrates');
    return List.generate(maps.length, (i) {
      return Vertebrate(
        id: maps[i]['id'],
        nome: maps[i]['nome'],
        idade: maps[i]['idade'],
        especie: maps[i]['especie'],
        tipoColunaVertebral: maps[i]['tipoColunaVertebral'],
      );
    });
  }

  @override
  Future<void> save(Vertebrate vertebrate) async {
    await _initDatabase();
    await _database.insert(
      'vertebrates',
      vertebrate.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> remove(dynamic id) async {
    await _initDatabase();
    await _database.delete(
      'vertebrates',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
