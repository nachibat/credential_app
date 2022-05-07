import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final mainTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: Colors.grey[300],
);

portrait() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
  SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
}

landscape() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]);
  SystemChrome.setEnabledSystemUIOverlays([]);
}
