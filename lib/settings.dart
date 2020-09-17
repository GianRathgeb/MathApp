import './models/colors.dart';


final Map<String, dynamic> themeSettings = {
  'headlineFontSize': 20.0,
  'fontSize': 18.0,
  'mainFont': 'OpenSans',
  'secondaryFont': 'Quicksand',
};

final Map<String, dynamic> lightThemeSettings = {
  'fontColor': primaryBlack,
  'backgroundColor': primaryWhite,
  'primaryColor': primaryWhite,
  'accentColor': primaryWhite,
};

final Map<String, dynamic> darkThemeSettings = {
  'fontColor': primaryWhite,
  'backgroundColor': primaryGrey[600],
  'primaryColor': primaryBlack,
  'accentColor': primaryBlack,
};
