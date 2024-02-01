import 'package:flutter/material.dart';
import 'login.dart';
import 'Base_de_datos.dart';
class Registro extends StatefulWidget {
  Registro ({Key? key}) : super (key: key);

  @override
  _Registro createState() => _Registro();
}

class _Registro extends State <Registro> {
  late String Nombre;
  late String Contrasea;
  late String correo;

  TextEditingController _correoController = TextEditingController();
  TextEditingController _contrasenaController = TextEditingController();
  TextEditingController _nombreController = TextEditingController();
  final aBdd= Base_de_datos();
  bool  resultado = false;
  @override
  Widget build (BuildContext context){
    return Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
        padding: EdgeInsets.symmetric(
        horizontal: 30.0,
        vertical: 90.0
    ),
    children: [
        Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 100.0,
              backgroundColor: Colors.black,
              backgroundImage: AssetImage ('images/icono.png'),
            ),
            Text(
              'Registro',
              style: TextStyle (
                  fontFamily: 'PLAIN',
                  color: Colors.white,
                  fontSize: 40.0
              ),
            ),
            Divider(
              color: Colors.black,
              height: 10.0,
            ),
            const SizedBox(height: 10,),
            TextField(
              controller: _nombreController,
              style: TextStyle(
                  color:Colors.white
              ),
              cursorColor: Colors.white,
              enableInteractiveSelection: false,
              autofocus: true,
              textCapitalization: TextCapitalization.characters,
              decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: "a@gmail.com",
                labelText: "Nombre",
                suffixIcon: Icon (
                    Icons.supervised_user_circle_rounded
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)
                ),

              ),
              onChanged: (text) {
                Nombre = text;
              },
            ),
            Divider(
              height: 30.0,
              color: Colors.black,
            ),

            TextField(
              controller:  _correoController,
              style: TextStyle(
                color: Colors.white,
              ),
              cursorColor: Colors.white,
              enableInteractiveSelection: false,
              autofocus: true,
              textCapitalization: TextCapitalization.characters,
              decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: "a@gmail.com",
                labelText: "Correo electrónico",
                suffixIcon: Icon(Icons.alternate_email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              onChanged: (text) {
                correo = text;
              },
            ),
            Divider(
              height: 30.0,
              color: Colors.black,
            ),
            TextField(
              controller: _contrasenaController,
              style: TextStyle(
                  color:Colors.white
              ),
              cursorColor: Colors.white,
              enableInteractiveSelection: false,
              obscureText: true,
              autofocus: true,
              textCapitalization: TextCapitalization.characters,
              decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: "*************",
                labelText: "Contraseña",
                suffixIcon: Icon (
                    Icons.lock_outline
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)
                ),

              ),
              onChanged: (text) {
                Contrasea = text;
              },
            ),

            Divider(
              height: 25.0,
              color: Colors.black,
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  _comprobar();
                  if (_correoController.text.isNotEmpty && _contrasenaController.text.isNotEmpty && _nombreController.text.isNotEmpty
                  && correo.contains("@") ) {
                    if (resultado) {
                      _insertar();
                      _correoController.clear();
                      _nombreController.clear();
                      _contrasenaController.clear();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => login()),
                      );
                    }
                    else if (!resultado) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Error"),
                          content: Text("Correo electronico registrado anteriormente"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("OK"),
                            ),
                          ],
                        ),
                      );
                    }
                    else if (_contrasenaController.text.length < 8){
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Error"),
                          content: Text("La longitud debe ser de minimo 8 caracteres"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("OK"),
                            ),
                          ],
                        ),
                      );
                    }
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Error"),
                        content: Text("Por favor verifique todos los campos."),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("OK"),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: Text(
                    'Registrarse',
                    style: TextStyle (
                      fontSize: 20.0,
                      color: Colors.white
                    ),
                  ),
                style: ButtonStyle(
                  backgroundColor:MaterialStateProperty.all<Color>(Colors.blue),
                ),
              ),

            ),
            Divider(
              height: 15.0,
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('¿Ya eres usuario?',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),

                TextButton(
                    child: const Text('inicia sesion',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onPressed: () {
                      _ver();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => login()),

                      );}
                )
              ],
            )
          ],
        )

    ],
        )

    );
  }

  void _insertar () async {
    await aBdd.ADatos(correo, Nombre, Contrasea);
  }

  void _ver () async{
    await aBdd.consultar();
  }
  Future<void> _comprobar() async {
     resultado = await aBdd.comprobar(correo);
     print('__________________________________------------------------_____________________-_________-____________________gsgshajvsbxbcsajbdnkaknm');
     print(resultado);
  }
}



