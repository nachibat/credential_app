import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:facultad_app/src/services/services.dart';

class DrawerWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/frente_actual.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.list_rounded, color: Colors.indigo),
            title: Text('Mis datos'),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'profile');
            },
          ),
          ListTile(
            leading: Icon(Icons.credit_card_rounded, color: Colors.indigo),
            title: Text('Credencial'),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'credential');
            },
          ),
          ListTile(
            leading: Icon(Icons.logout_rounded, color: Colors.indigo),
            title: Text('Cerrar sesión'),
            onTap: () async {
              await authService.logout();
              Navigator.pushReplacementNamed(context, 'login');
            },
          ),
        ],
      ),
    );
  }
}