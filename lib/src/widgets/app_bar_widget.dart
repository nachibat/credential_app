import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {

  final title;

  const AppBarWidget(this.title);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      brightness: Brightness.dark,
      elevation: 0,
      backgroundColor: Colors.indigo,
      title: Text(title),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}