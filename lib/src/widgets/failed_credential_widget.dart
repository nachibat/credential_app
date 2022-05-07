import 'package:flutter/material.dart';

import 'package:facultad_app/src/widgets/widgets.dart';

class FailedCredential extends StatelessWidget {
  final String apellido;
  final String nombre;

  const FailedCredential({Key? key, required this.apellido, required this.nombre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget('Credencial Universitaria'),
      drawer: DrawerWidget(),
      body: Card(
        margin: EdgeInsets.all(10),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          height: 390,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _photoCard(),
              _titleCard(),
              _contentCard(),
            ],
          ),
        ),
      ),
    );
  }

  Container _titleCard() {
    return Container(
      padding: EdgeInsets.only(top: 15, left: 25, right: 25),
      child: Text(
        '$apellido $nombre',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Container _contentCard() {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 25, right: 25),
      child: Text(
        'Usted no posee Credencial Universitaria de descuentos. Para tramitar la credencial, dirigirse a la Secretaría de Gestión Institucional de la FRSN de Lunes a Viernes de 15:00 a 21:00 hs.',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 15,
          height: 1.3 // Espacio entre lineas de texto
        ),
        // textAlign: TextAlign.justify,
      ),
    );
  }

  ClipRRect _photoCard() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20)
      ),
      child: Image(
        image: AssetImage('assets/frente_slide.jpg')                
      ),
    );
  }
}