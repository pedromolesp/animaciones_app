import 'dart:math';

import 'package:animaciones_app/helpers/media_size.dart';
import 'package:animaciones_app/styles/colors.dart';
import 'package:animaciones_app/styles/fonts.dart';
import 'package:animaciones_app/view/widgets/floating_action_button.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AnimatedWidgetNatives extends StatefulWidget {
  @override
  _AnimatedWidgetNativesState createState() => _AnimatedWidgetNativesState();
}

class _AnimatedWidgetNativesState extends State<AnimatedWidgetNatives> {
  double height1 = 100;
  double width1 = 100;
  double height2 = 100;
  double width2 = 100;
  bool color = true;
  @override
  Widget build(BuildContext context) {
    Size size = getMediaSize(context);
    height1 = Random().nextDouble() * 200;
    width1 = Random().nextDouble() * 200;
    height2 = Random().nextDouble() * size.height * 0.9;
    width2 = Random().nextDouble() * size.width * 0.9;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: feldgrau,
        title: Text("6. Animated widgets"),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        color: mirtleGreen,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: width1,
                height: height1,
                child: AutoSizeText(
                  "AutoSizedText en AnimatedContainer",
                  maxLines: 2,
                  minFontSize: 8,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: Fonts.muliBold,
                      color: color ? white : black),
                ),
                color: color ? Colors.blue : Colors.amber,
              ),
            ),
            AnimatedPositioned(
                top: height2,
                left: width2,
                child: Container(
                  width: size.width * 0.1,
                  height: size.width * 0.1,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color ? Colors.amber : Colors.blue,
                  ),
                  child: getFloatingActionButtonNext(context, size, 'charts'),
                ),
                duration: Duration(milliseconds: 500)),
            Positioned(
                top: 30,
                child: AnimatedOpacity(
                  duration: Duration(
                    milliseconds: 500,
                  ),
                  opacity: !color ? 1.0 : 0.0,
                  child: Text(
                    "AnimatedOpacity",
                    style: TextStyle(fontSize: 40, color: white),
                  ),
                )),
            Positioned(
                bottom: 10,
                child: Container(
                  width: size.width * 0.3,
                  height: size.height * 0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: white,
                  ),
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        color = !color;
                      });
                    },
                    child: Text("Reiniciar"),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
