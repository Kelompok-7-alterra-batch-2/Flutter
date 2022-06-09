import 'package:flutter/cupertino.dart';

class Settings {
  bool isTablet = false;

  final h1 = const TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );
  final h2 = const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
  );
  final h3 = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );
  final body1 = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  final body2 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  final body3 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  final body4 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
  final body5 = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  final body6 = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  final cPrimary = const Color(0xff4e89a8);
  final cNeutral = const Color(0xff060f1d);
  final cGrey1 = const Color(0xffb3bdc9);
  final cGrey2 = const Color(0xffccd5de);
  final cGrey3 = const Color(0xffe2eaf2);
  final cGrey4 = const Color(0xffeef3ed);
}

var sett = Settings();
