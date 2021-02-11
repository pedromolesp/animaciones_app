import 'package:animaciones_app/helpers/media_size.dart';
import 'package:animaciones_app/styles/colors.dart';
import 'package:animaciones_app/styles/fonts.dart';
import 'package:animaciones_app/view/widgets/floating_action_button.dart';
import 'package:flutter/material.dart';

class Presentacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = getMediaSize(context);
    return Scaffold(
      backgroundColor: iris,
      floatingActionButton:
          getFloatingActionButtonNext(context, size, "hero", color: black),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: size.width * 0.3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage(
                      placeholder: AssetImage("assets/images/transparent.png"),
                      image: AssetImage("assets/images/QMVS5680.JPG"),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Pedro Molina",
                      maxLines: 2,
                      style: TextStyle(
                        color: white,
                        fontFamily: Fonts.muliBlack,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Valdepeñas de Jaén",
                      maxLines: 2,
                      style: TextStyle(
                        color: white,
                        fontFamily: Fonts.muliRegular,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage("assets/images/transparent.png"),
                image: AssetImage("assets/images/virgen.jpeg"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Estudiante del IES VIRGEN DEL CARMEN, matrícula de honor del curso 1980/1981.",
              style: TextStyle(
                color: white,
                fontFamily: Fonts.muliItalic,
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
