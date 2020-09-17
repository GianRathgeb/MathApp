import 'package:flutter/material.dart';

const _blackPrimaryValue = 0xFF000000;

const MaterialColor primaryBlack = const MaterialColor(
  _blackPrimaryValue,
  const <int, Color>{
    50: const Color(0xFFe0e0e0),
    100: const Color(0xFFb3b3b3),
    200: const Color(0xFF808080),
    300: const Color(0xFF4d4d4d),
    400: const Color(0xFF262626),
    500: const Color(_blackPrimaryValue),
    600: const Color(0xFF000000),
    700: const Color(0xFF000000),
    800: const Color(0xFF000000),
    900: const Color(0xFF000000),
  },
);

const _whitePrimaryValue = 0xFFFFFFFF;

const MaterialColor primaryWhite = const MaterialColor(
  _whitePrimaryValue,
  <int, Color>{
    50: Color(0x0DFFFFFF),
    100: Color(0x1AFFFFFF),
    200: Color(0x33FFFFFF),
    300: Color(0x4DFFFFFF),
    400: Color(0x66FFFFFF),
    500: Color(_whitePrimaryValue),
    600: Color(0x99FFFFFF),
    700: Color(0xB3FFFFFF),
    800: Color(0xCCFFFFFF),
    900: Color(0xE6FFFFFF),
  },
);
