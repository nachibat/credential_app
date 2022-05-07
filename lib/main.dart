import 'package:facultad_app/src/services/services.dart';
import 'package:facultad_app/src/themes/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:facultad_app/src/routes/routes.dart';
import 'package:provider/provider.dart';

 
void main() => runApp(AppState());

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService())
      ],
      child: MyApp(),
    );
  }
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ));
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      routes: getApplicationRoutes(),
      initialRoute: 'checking',
      scaffoldMessengerKey: NotificationService.messengerKey,
      theme: mainTheme,
    );
  }
}
