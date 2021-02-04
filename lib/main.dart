import 'package:animaciones_app/pages/hero_animation_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animaciones app',
      debugShowCheckedModeBanner: false,
      initialRoute: 'hero',
      routes: {'hero': (BuildContext context) => HeroAnimationPage()},
    );
  }
}
