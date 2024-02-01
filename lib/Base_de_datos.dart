import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
var path;

class Base_de_datos {
  Future <Database> abrir_bd() async {
    final Basededatosp= await getDatabasesPath();
     path= join(Basededatosp, 'Basededatos.db');

    return openDatabase
      (path, onCreate: (db, version) async {
        await db.execute('CREATE TABLE usuarios (correo TEXT PRIMARY KEY,'
            ' nombre TEXT NOT NULL, contraseña TEXT NOT NULL)',);
        
      
    }, version: 1
    );

  }

  Future <void> ADatos (String correo, String  Nombre, String Contrasea) async {
    final ponerd= await abrir_bd();
    await ponerd.insert('usuarios', {'correo' :correo, 'nombre':Nombre ,
      'contraseña' : Contrasea },
      conflictAlgorithm: ConflictAlgorithm.replace
    );
    await ponerd.close();
  }
Future <void> consultar() async {
  final ponerd= await abrir_bd();
  final data= await ponerd.query('usuarios');
  print(data);
}
  Future<bool> comprobar(String correo) async {
    Database database = await abrir_bd(); // Usa la misma instancia de base de datos que ya has abierto
    List<Map<String, dynamic>> result = await database.rawQuery(
      'SELECT COUNT(*) as count FROM usuarios WHERE correo = ?',
      [correo],
    );
    await database.close();
    int count = Sqflite.firstIntValue(result) ?? 0;
    if (count == 0) {
      return true;
    }
    return false ;
  }

  Future<bool> comprobar_correo (String correo, String contrasena) async {
    Database database = await abrir_bd();
    List<Map<String, dynamic>> result = await database.rawQuery(
      'SELECT COUNT(*) as count FROM usuarios WHERE correo = ? AND contraseña = ?',
      [correo, contrasena],
    );
    await database.close();
    int count = Sqflite.firstIntValue(result) ?? 0;

    if (count > 0) {
      return true;
    }
    return false;
  }

}