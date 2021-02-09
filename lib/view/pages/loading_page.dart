import 'package:animaciones_app/helpers/media_size.dart';
import 'package:animaciones_app/styles/colors.dart';
import 'package:animaciones_app/styles/fonts.dart';
import 'package:animaciones_app/view/widgets/logo.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = getMediaSize(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 4)).then((e) {
        Navigator.pushReplacementNamed(context, 'presentacion');
      });
    });
    return Container(
      width: size.width,
      height: size.height,
      color: iris,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LogoWidget(
              size: size,
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            Text(
              "Diseño y layouts",
              style: TextStyle(
                  color: blueBell,
                  decoration: TextDecoration.none,
                  fontFamily: Fonts.muliBlack,
                  fontSize: size.width * 0.07),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
