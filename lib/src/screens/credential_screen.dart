import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:facultad_app/src/themes/main_theme.dart';
import 'package:facultad_app/src/services/services.dart';
import 'package:facultad_app/src/widgets/widgets.dart';

class CredentialScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<AuthService>(context, listen: false).user;

    if (user.usuario != null) {
      // landscape();
      final userAgent = window.navigator.userAgent.toString().toLowerCase();
      if (userAgent.contains('android')) {
        document.documentElement!.requestFullscreen();
      }
      return SuccessCredential(apellido: user.apelNom!, nombre: user.apelNom!, legajo: user.legajo!,);
    } else {
      portrait();
      return FailedCredential(apellido: user.apelNom!, nombre: user.apelNom!,);
    }

  }
}



