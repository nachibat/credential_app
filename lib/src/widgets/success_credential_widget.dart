import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:facultad_app/src/services/auth_service.dart';
import 'package:facultad_app/src/widgets/widgets.dart';

class SuccessCredential extends StatelessWidget {
  final String apellido;
  final String nombre;
  final int legajo;

  final GlobalKey<ScaffoldState> _scaffoldState = new GlobalKey<ScaffoldState>();

  SuccessCredential({
    Key? key,
    required this.apellido,
    required this.nombre,
    required this.legajo
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      drawer: DrawerWidget(),
      body: Container(
          child: Stack(
              children: [
                _background(),
                _content(context),
              ],
            ),
        ),
      );
  }

  Image _background() {
    return Image(
      width: double.infinity,
      image: AssetImage('assets/frente_slide.jpg'),
      fit: BoxFit.cover,
    );
  }

  Row _content(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // width: double.infinity,
                padding: EdgeInsets.only(top: 10, left: 10),
                height: MediaQuery.of(context).size.height * 0.5,
                child: GestureDetector(
                  onTap: () {
                    _scaffoldState.currentState!.openDrawer();
                  },
                  child: Image(
                    alignment: Alignment.topCenter,
                    width: 200,
                    image: AssetImage('assets/logo_utn_sn.png')
                  ),
                ),
                
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
                child: Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Apellido y nombre', style: _textStyle(16)),
                      Text('$apellido', style: _textStyle(35)),
                      Text('Nº Legajo', style: _textStyle(16)),
                      Text('$legajo', style: _textStyle(35))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,    
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 30, right: 30),
                // child: Image(
                //   width: 100,
                //   image: AssetImage('assets/user.png')
                // ),
                child: authService.getImage(50),
              ),
            ]
          ),
        ),
      ]
    );
  }

  TextStyle _textStyle(double size) {
    return TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.8),
      fontSize: size,
      shadows: [
        Shadow(
          color: Colors.black,
          offset: Offset(2, 5),
          blurRadius: 10
        )
      ]
    );
  }

}