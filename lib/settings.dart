import 'package:flutter/material.dart';

import './models/colors.dart';

final Map<String, dynamic> themeSettings = {
  'headlineFontSize': 22.0,
  'fontSize': 18.0,
  'mainFont': 'OpenSans',
  'secondaryFont': 'Quicksand',
};

final Map<String, dynamic> lightThemeSettings = {
  'fontColor': primaryBlack,
  'backgroundColor': primaryWhite,
  'primaryColor': Colors.grey,
  'accentColor': primaryWhite,
};

final Map<String, dynamic> darkThemeSettings = {
  'fontColor': primaryWhite,
  'backgroundColor': primaryBlack[300],
  'primaryColor': primaryBlack,
  'accentColor': primaryBlack,
};
