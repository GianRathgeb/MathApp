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


const _greyPrimaryValue = 0xFF9E9E9E;

 const MaterialColor primaryGrey = const MaterialColor(
  _greyPrimaryValue,
  <int, Color>{
    50: Color(0xFFFAFAFA),
    100: Color(0xFFF5F5F5),
    200: Color(0xFFEEEEEE),
    300: Color(0xFFE0E0E0),
    350: Color(0xFFD6D6D6), // only for raised button while pressed in light theme
    400: Color(0xFFBDBDBD),
    500: Color(_greyPrimaryValue),
    600: Color(0xFF757575),
    700: Color(0xFF616161),
    800: Color(0xFF424242),
    850: Color(0xFF303030), // only for background color in dark theme
    900: Color(0xFF212121),
  },
);
