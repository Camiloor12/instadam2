import 'package:flutter/cupertino.dart';
import 'Registro.dart';
import 'login.dart';
import 'Base_de_datos.dart';
export 'package:flutter/material.dart';
import 'package:instadamll/PaginaP.dart';

class login extends StatefulWidget {
  login ({Key? key}) : super (key: key);

  @override
  _LoginA createState() => _LoginA();
}

class _LoginA extends State <login> {
  TextEditingController _correoController = TextEditingController();
  TextEditingController _contrasenaController = TextEditingController();
  late String Contrasena;
   bool si= false;
  late String correo;
  final aBdd= Base_de_datos();
  @override
  Widget build (BuildContext context){
      return Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 90.0
          ),
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 100.0,
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage ('images/icono.png'),
                ),
                Text(
                  'Inicia sesión',
                  style: TextStyle (
                    fontFamily: 'PLAIN',
                    color: Colors.white,
                    fontSize: 40.0
                  ),
                ),
               SizedBox(
                 width: 160.0,
                 height: 15.0,
                 child: Divider (
                   color: Colors.black,
                 ),
               ),
                TextField(
                  controller: _correoController,
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
                      labelText: "Correo electronico",
                      suffixIcon: Icon (
                        Icons.alternate_email
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)
                      ),

                    ),
                  onChanged: (text) {
                    correo = text;
                  },
                ),
                Divider(
                  height: 18.0,
                  color: Colors.black,
                ),
                TextField(
                  controller: _contrasenaController,
                  style: TextStyle(
                    color:Colors.white,
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
                    Contrasena = text;
                  },

                ),
                Divider(
                  height: 30.0,
                  color: Colors.black,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      child:
                      Text (
                        'Iniciar sesión',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    style: ButtonStyle(
                      backgroundColor:MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {
                    _comprobarC();
                        if (_correoController.text.isNotEmpty && _contrasenaController.text.isNotEmpty) {

                          if (si) {
                            _correoController.clear();
                            _contrasenaController.clear();
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PaginaP()),
                            );
                          }
                          else if(!si) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("Error"),
                                content: Text("Correo electronico o contraseñas incorrecta"),
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
                        }
                        else {
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
                  ),

                  ),
                const SizedBox(height: 12),
                const Divider(
                  height: 10.0,
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('¿No eres usuario?',
                      style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                      ),
                    ),

                    TextButton(
                      child: const Text('Crea una cuenta',
                        style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        ),
                      ),
                      onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Registro()),
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
  Future<void> _comprobarC() async {
    si = await aBdd.comprobar_correo(correo, Contrasena);
    print('__________________________________------------------------_____________________-_________-____________________gsgshajvsbxbcsajbdnkaknm');
    print(si);
  }
}

