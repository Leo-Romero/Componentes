import 'package:flutter/material.dart';
import 'package:componentes/src/screens/home_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Componentes App',
        home: HomePage());
  }
}
