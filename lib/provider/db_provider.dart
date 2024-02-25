import 'dart:io';

import 'package:materias_tareas_udm/models/materias.dart';
import 'package:materias_tareas_udm/models/tareas.dart';
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
            'idUsuario TEXT'
            ')');
        db.execute('CREATE TABLE Tareas ('
            'id INTEGER PRIMARY KEY,'
            'titulo TEXT,'
            'materia Text,'
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

  Future<int> nuevaMateria(Materias materia) async {
    final db = await database;

    final res = await db!.insert('Materias', {
      'nombre': materia.nombre.toString(),
      'idUsuario': materia.idUsuario.toString(),
    });

    return res;
  }

  Future<List<Materias>> getMaterias(String idUsuario) async {
    final db = await database;
    List<Materias> list = [];

    final res = await db!
        .query("Materias", where: "idUsuario = ?", whereArgs: [idUsuario]);
    for (var materia in res) {
      list.add(Materias(
        id: int.parse(materia['id'].toString()),
        nombre: materia['nombre'].toString(),
        idUsuario: materia['idUsuario'].toString(),
      ));
    }
    return list;
  }

  Future<int?> deleteMateria(Materias materia) async {
    final db = await database;

    final res = await db!.delete(
      'Materias',
      where: 'id = ?',
      whereArgs: [materia.id],
    );

    return res;
  }

  Future<int?> updateMateria(Materias materia) async {
    final db = await database;

    final res = await db!.update(
      'Materias',
      {
        'nombre': materia.nombre.toString(),
      },
      where: 'id = ?',
      whereArgs: [materia.id],
    );
    print(res);
    return res;
  }

  Future<int> nuevaTarea(Tareas tarea) async {
    final db = await database;

    final res = await db!.insert('Tareas', {
      'titulo': tarea.titulo.toString(),
      'materia': tarea.materia.toString(),
      'idUsuario': tarea.idUsuario.toString(),
    });

    return res;
  }

  Future<List<Tareas>> getTareas(String idUsuario) async {
    final db = await database;
    List<Tareas> list = [];

    final res = await db!
        .query("Tareas", where: "idUsuario = ?", whereArgs: [idUsuario]);
    for (var tarea in res) {
      list.add(Tareas(
        id: int.parse(tarea['id'].toString()),
        titulo: tarea['titulo'].toString(),
        materia: tarea['materia'].toString(),
        idUsuario: tarea['idUsuario'].toString(),
      ));
    }
    return list;
  }

  Future<int?> deleteTarea(Tareas tarea) async {
    final db = await database;

    final res = await db!.delete(
      'Tareas',
      where: 'id = ?',
      whereArgs: [tarea.id],
    );

    return res;
  }
}
