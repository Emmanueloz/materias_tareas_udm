import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database?> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'MateriasTareas.db');

    return openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (db, version) {
        db.execute("""CREATE TABLE Usuarios (
          id INTEGER PRIMARY KEY,
          usuario TEXT,
          correo TEXT,
          password TEXT
        )""");
        db.execute('CREATE TABLE Materias ('
            'id INTEGER PRIMARY KEY,'
            'nombre TEXT,'
            'color TEXT'
            ')');
        db.execute('CREATE TABLE Tareas ('
            'id INTEGER PRIMARY KEY,'
            'titulo TEXT,'
            'materiaId INTEGER,'
            'completada INTEGER'
            ')');
      },
    );
  }
}
