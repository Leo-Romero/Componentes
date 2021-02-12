import 'package:flutter/material.dart';
import 'package:componentes/src/screens/alert_page.dart';
import 'package:componentes/src/screens/avatar_page.dart';
import 'package:componentes/src/screens/home_page.dart';
import 'package:componentes/src/screens/card_page.dart';
import 'package:componentes/src/screens/animated_container.dart';
import 'package:componentes/src/screens/input_page.dart';
import 'package:componentes/src/screens/slider_page.dart';
import 'package:componentes/src/screens/listview_page.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
    'animatedContainer': (BuildContext context) => AnimatedContainerPage(),
    'inputs': (BuildContext context) => InputPage(),
    'slider': (BuildContext context) => SliderPage(),
    'list': (BuildContext context) => ListaPage(),
  };
}
