import 'package:facultad_app/src/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:facultad_app/src/services/services.dart';

class CheckAuthScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    authService.loadPicture();

    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: authService.readData(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            print(snapshot.data);
            if (snapshot.data == '') {
              Future.microtask(() {
                // Navigator.of(context).pushReplacementNamed('login');
                // El siguiente Navigator reemplaza al anterior y hace que no se vea la transicion de un screen al otro
                Navigator.pushReplacement(context, PageRouteBuilder(
                  pageBuilder: (_, __, ___) => LoginScreen(),
                  transitionDuration: Duration(seconds: 0)
                ));
              });
            } else {
              Future.microtask(() {
                Navigator.pushReplacement(context, PageRouteBuilder(
                  pageBuilder: (_, __, ___) => CredentialScreen(),
                  transitionDuration: Duration(seconds: 0)
                ));
              });
            }
            return CircularProgressIndicator();
          }
        )
      ),
    );
  }
}