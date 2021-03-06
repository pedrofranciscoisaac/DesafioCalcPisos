import 'package:calculator_floor/core/constants.dart';
import 'package:calculator_floor/core/theme_app.dart';
import 'package:calculator_floor/pages/calculator_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppTitle,
      theme: kAppTheme,
      home: CalculatorPage(),
    );
  }
}
