import 'package:flutter/material.dart';
import 'package:instadamll/login.dart';
import 'Base_de_datos.dart';
import 'package:instadamll/PaginaP.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget{
  @override
  final aBdd= Base_de_datos();
  Widget build (BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instadam',
      home: PaginaP(),
    );
  }


}