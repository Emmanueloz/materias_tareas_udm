import 'dart:io';

import 'package:materias_tareas_udm/models/usuarios.dart';
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
          correo TEXT PRIMARY KEY,
          usuario TEXT,
          password TEXT
        )""");
        db.execute('CREATE TABLE Materias ('
            'id INTEGER PRIMARY KEY,'
            'nombre TEXT,'
            'color TEXT,'
            'idUsuario TEXT'
            ')');
        db.execute('CREATE TABLE Tareas ('
            'id INTEGER PRIMARY KEY,'
            'titulo TEXT,'
            'materiaId INTEGER,'
            'completada INTEGER,'
            'idUsuario TEXT'
            ')');
      },
    );
  }

  Future<int> nuevoUsuario(Usuario usuario) async {
    final db = await database;

    final res = await db!.insert('Usuarios', {
      'correo': usuario.correo.toString(),
      'usuario': usuario.nombre.toString(),
      'password': usuario.password.toString(),
    });

    return res;
  }

  Future<Usuario?> getUsuario(String correo) async {
    final db = await database;
    final res =
        await db!.query('Usuarios', where: 'correo = ?', whereArgs: [correo]);

    return res.isNotEmpty
        ? Usuario(
            correo: res.first['correo'].toString(),
            nombre: res.first['usuario'].toString(),
            password: res.first['password'].toString(),
          )
        : null;
  }
}
