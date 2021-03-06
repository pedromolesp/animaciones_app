import 'package:animaciones_app/styles/colors.dart';
import 'package:animaciones_app/view/pages/animated_widgets_native6.dart';
import 'package:animaciones_app/view/pages/charts7.dart';
import 'package:animaciones_app/view/pages/clippers10.dart';
import 'package:animaciones_app/view/pages/compass9.dart';
import 'package:animaciones_app/view/pages/loading_page.dart';
import 'package:animaciones_app/view/pages/lottie_animation5.dart';
import 'package:animaciones_app/view/pages/native_animation_page2.dart';
import 'package:animaciones_app/view/pages/presentacion1.dart';
import 'package:animaciones_app/view/pages/sensors8.dart';
import 'package:animaciones_app/view/pages/sliverappbar4.dart';
import 'package:animaciones_app/view/pages/tabbar_view3.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: transparent));

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Animaciones app',
      debugShowCheckedModeBanner: false,
      initialRoute: 'loading',
      routes: {
        'sliver': (BuildContext context) => SliverBarView(),
        'loading': (BuildContext context) => LoadingPage(),
        'hero': (BuildContext context) => NativeAnimationPage(),
        'detailhero': (BuildContext context) => DetailHeroAnimation(),
        'presentacion': (BuildContext context) => Presentacion(),
        'tabbarview': (BuildContext context) => TabbarViewPage(),
        'lottie': (BuildContext context) => LottieAnimation(),
        'animated': (BuildContext context) => AnimatedWidgetNatives(),
        'charts': (BuildContext context) => ChartView(),
        'sensors': (BuildContext context) => SensorsAnimated(),
        'compass': (BuildContext context) => CompassAnimation(),
        'clippers': (BuildContext context) => ClippersView(),
      },
    );
  }
}
