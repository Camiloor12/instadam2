import 'package:flutter/material.dart';

class PaginaP extends StatefulWidget {
  PaginaP({Key? key}) : super(key: key);

  @override
  _PaginaPState createState() => _PaginaPState();
}

class _PaginaPState extends State<PaginaP> {
  int index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white12,
        title: const Text(
          'InstaDam',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'images/icono.png',
            width: 30,
            height: 30,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        backgroundColor: Colors.white10,
        elevation: 5,
        onTap: (valor){
          setState(() {
            index=valor;
          });
      },
        items: [
          BottomNavigationBarItem(
              icon: Icon (Icons.add_a_photo
              ,color: Colors.white),
            label: "Abrir la camara"
          ),
          BottomNavigationBarItem(
              icon: Icon (Icons.upload
                  ,color: Colors.white),
            label: "Subir Foto",
          )
        ],
        selectedLabelStyle: TextStyle(color: Colors.white),
        unselectedLabelStyle: TextStyle(color: Colors.blueAccent),
      ),


      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [


        ],
      ),
    );
  }
}
