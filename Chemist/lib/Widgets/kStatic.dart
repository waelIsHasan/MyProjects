import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/AppProvider.dart';
class kStatically {
  static Color  kStaticColor=Colors.blue;
  static LinearGradient gradient =const LinearGradient(
  colors: [Colors.indigoAccent,Colors.blue,Colors.lightBlue,Colors.cyan,Colors.cyanAccent,Colors.cyanAccent],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  );
}