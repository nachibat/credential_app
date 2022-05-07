import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

import 'package:facultad_app/src/services/services.dart';
import 'package:facultad_app/src/widgets/widgets.dart';
import 'package:facultad_app/src/themes/main_theme.dart';

class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    portrait();

    final user = Provider.of<AuthService>(context, listen: false).user;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget('Mis datos'),
      drawer: DrawerWidget(),
      body: Center(
        child: Container(
          child: ListView(
            children: [
              _ProfilePhoto(),
              _cardTile('Usuario:', user.usuario!),
              _cardTile('Legajo:', user.legajo.toString()),
              _cardTile('Nombre:', user.apelNom!),
              _cardTile('Nro. Doc:', user.dni.toString()),
              _cardTile('Tipo:', user.tipo!),
              _cardTile('Especialidad:', user.especialidad!),
              _cardTile('Año que cursa:', user.anioCursa.toString() + 'º'),
            ],
          ),
        ),
      ),
    );
  }

  Card _cardTile(String label, String value) {
    return Card(
      margin: EdgeInsets.all(0),
      elevation: 0,      
      child: ListTile(
        leading: Text(label, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        title: Text(value)));
  }
}

class _ProfilePhoto extends StatelessWidget {  

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 120),
          width: double.infinity,
          child: GestureDetector(
            child: authService.getImage(75),
            onTap: () async {
              final picker = new ImagePicker();
              final XFile? pickedFile = await picker.pickImage(
                source: ImageSource.camera,
                preferredCameraDevice: CameraDevice.front,
                imageQuality: 100
              );
              if (pickedFile == null) {
                print('No selecciono nada');
                return;
              }
              print('Tenemos imagen: ${pickedFile.path}');
              authService.takePicture(pickedFile.path);
            },
          ),
        ),
        Positioned(
          bottom: 30,
          right: 125,
          // child: Image(
          //   height: 30,
          //   image: AssetImage('assets/camara.png'),
          // ),
          child: Icon(Icons.camera_alt_outlined, size: 50, color: Colors.black54),
        )
      ] 
    );
  }
}