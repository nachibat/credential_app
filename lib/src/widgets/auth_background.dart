import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {

  final Widget child;

  const AuthBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _PurpleBox(),
          _HeaderIcon(),
          this.child,
        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: Image(
          image: AssetImage('assets/logo.png'),
          width: 160,
          height: 160,
        ),
      ),
    );
  }
}

class _PurpleBox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _purpleBackground(),
      child: Stack(
        children: [
          Positioned(child: _Square(), top: 100, left: 30,),
          Positioned(child: _Square(), top: 20, left: 60,),
          Positioned(child: _Square(), top: 60, right: 100,),
          Positioned(child: _Square(), top: 80, left: 130,),
          Positioned(child: _Square(), top: -10, left: -10,),
          Positioned(child: _Square(), top: 10, right: 20,),
          Positioned(child: _Square(), bottom: -10, left: 10,),
          Positioned(child: _Square(), bottom: 150, left: 10,),
          Positioned(child: _Square(), bottom: 120, right: 30,),
          Positioned(child: _Square(), bottom: 90, right: 50,),
          Positioned(child: _Square(), bottom: 110, right: 80,),
          Positioned(child: _Square(), bottom: 70, right: 160,),
          Positioned(child: _Square(), bottom: 100, right: 300,),
          Positioned(child: _Square(), bottom: 10, right: 60,),
          Positioned(child: _Square(), bottom: 50, left: 100,),
        ],
      ),
    );
  }

  BoxDecoration _purpleBackground() => BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color.fromRGBO(63, 63, 156, 1),
        Color.fromRGBO(90, 70, 178, 1),
      ],
    ),
  );
}

class _Square extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );
  }
}