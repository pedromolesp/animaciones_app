import 'package:animaciones_app/view/pages/native_animation_page2.dart';
import 'package:animaciones_app/view/pages/presentacion1.dart';
import 'package:animaciones_app/view/pages/tabbar_view3.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animaciones app',
      debugShowCheckedModeBanner: false,
      initialRoute: 'presentacion',
      routes: {
        'hero': (BuildContext context) => NativeAnimationPage(),
        'detailhero': (BuildContext context) => DetailHeroAnimation(),
        'presentacion': (BuildContext context) => Presentacion(),
        'tabbarview': (BuildContext context) => TabbarViewPage()
      },
    );
  }
}
