import 'package:flutter/material.dart';

import 'package:facultad_app/src/screens/screens.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder> {
    'credential': (BuildContext context) => CredentialScreen(),
    'login': (BuildContext context) => LoginScreen(),
    'profile': (BuildContext context) => ProfileScreen(),
    'terms': (BuildContext context) => TermsScreen(),
    'checking': (BuildContext context) => CheckAuthScreen()
  };
}
