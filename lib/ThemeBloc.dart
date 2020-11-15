import 'package:flutter/material.dart';

class ThemeBloc with ChangeNotifier {
  bool _darkTheme = false;
  Color _colorPrimary = Colors.blue; //cor primária padrão;

  bool getDarkTheme() {
    return _darkTheme;
  }

  Color getColorPrimary() {
    return _colorPrimary;
  }

  setDarkTheme(bool newDarkTheme) {
    print('alterando tema para ' + (newDarkTheme ? "escuro" : "claro"));
    _darkTheme = newDarkTheme;
    notifyListeners();
  }

  setColorPrimary(Color newColorPrimary) {
    _colorPrimary = newColorPrimary;
    notifyListeners();
  }
}
