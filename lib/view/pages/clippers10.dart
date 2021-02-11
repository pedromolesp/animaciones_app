import 'dart:math';

import 'package:vector_math/vector_math.dart' as Vector;
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:animaciones_app/helpers/media_size.dart';
import 'package:animaciones_app/styles/colors.dart';

class ClippersView extends StatefulWidget {
  @override
  _ClippersViewState createState() => _ClippersViewState();
}

class _ClippersViewState extends State<ClippersView> {
  Color cielo;
  bool dianoche;
  @override
  void initState() {
    super.initState();
    cielo = blue6;
    dianoche = true;
  }

  @override
  Widget build(BuildContext context) {
    Size size = getMediaSize(context);
    dianoche ? cielo = blue6 : cielo = iris;
    return Container(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          Positioned(
            child: Container(
              color: cielo,
              width: size.width,
              height: size.height * 0.55,
            ),
          ),
          !dianoche
              ? Image.asset(
                  "assets/images/stars.png",
                  color: Colors.yellow,
                  width: size.width,
                  height: size.height,
                  fit: BoxFit.fitHeight,
                )
              : SizedBox(),
          Positioned(
            top: size.height * 0.1,
            left: size.width * 0.2,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "assets/images/cloud.png",
                    width: size.width * 0.4,
                  ),
                  Icon(
                    Icons.arrow_back,
                    color: blue6,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: size.width * 0.6,
            child: Image.asset(
              "assets/images/cloud.png",
              width: size.width * 0.3,
            ),
          ),
          Positioned(
            top: size.height * 0.1,
            right: dianoche ? size.width * 0.02 : size.width * 0.85,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  dianoche = !dianoche;
                });
              },
              child: Image.asset(
                dianoche ? "assets/images/sun2.png" : "assets/images/moon.png",
                width: dianoche ? size.width * 0.35 : size.width * 0.2,
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: DemoBody(
                size: size,
                xOffset: 200,
                yOffset: (size.height * 0.45).round(),
                color: blue5),
          ),
          Positioned(
            top: size.height * 0.26,
            child: Image.asset(
              "assets/images/barco.gif",
              width: size.width,
            ),
          ),
          Positioned(
            right: 0,
            child: DemoBody(
                size: size,
                xOffset: 300,
                yOffset: (size.height * 0.5).round(),
                color: blue4),
          ),
          Positioned(
            right: 0,
            child: DemoBody(
                size: size,
                xOffset: 200,
                yOffset: (size.height * 0.6).round(),
                color: blue3),
          ),
          Positioned(
            bottom: size.height * 0.3,
            right: size.width * 0.02,
            child: Image.asset(
              "assets/images/fish.gif",
              width: size.width * 0.35,
            ),
          ),
          Positioned(
            right: 0,
            child: DemoBody(
                size: size,
                xOffset: 10,
                yOffset: (size.height * 0.7).round(),
                color: blue2),
          ),
          Positioned(
            right: 0,
            child: DemoBody(
                size: size,
                xOffset: 79,
                yOffset: (size.height * 0.8).round(),
                color: blue1),
          ),
        ],
      ),
    );
  }
}

class DemoBody extends StatefulWidget {
  final Size size;
  final int xOffset;
  final int yOffset;
  final Color color;

  DemoBody(
      {Key key, @required this.size, this.xOffset, this.yOffset, this.color})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _DemoBodyState();
  }
}

class _DemoBodyState extends State<DemoBody> with TickerProviderStateMixin {
  AnimationController animationController;
  List<Offset> animList1 = [];

  @override
  void initState() {
    super.initState();

    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 2));

    animationController.addListener(() {
      animList1.clear();
      for (int i = -2 - widget.xOffset;
          i <= widget.size.width.toInt() + 2;
          i++) {
        animList1.add(new Offset(
            i.toDouble() + widget.xOffset,
            sin((animationController.value * 360 - i) %
                        360 *
                        Vector.degrees2Radians) *
                    20 +
                50 +
                widget.yOffset));
      }
    });
    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      child: new AnimatedBuilder(
        animation: new CurvedAnimation(
          parent: animationController,
          curve: Curves.easeInOut,
        ),
        builder: (context, child) => new ClipPath(
          child: Container(
            width: widget.size.width,
            height: widget.size.height,
            color: widget.color,
          ),
          clipper: new WaveClipper(animationController.value, animList1),
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  final double animation;

  List<Offset> waveList1 = [];

  WaveClipper(this.animation, this.waveList1);

  @override
  Path getClip(Size size) {
    Path path = new Path();

    path.addPolygon(waveList1, false);

    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(WaveClipper oldClipper) =>
      animation != oldClipper.animation;
}
