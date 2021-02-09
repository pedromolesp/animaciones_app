import 'package:animaciones_app/helpers/media_size.dart';
import 'package:animaciones_app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimation extends StatefulWidget {
  @override
  _LottieAnimationState createState() => _LottieAnimationState();
}

class _LottieAnimationState extends State<LottieAnimation>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Size size = getMediaSize(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: chineseRed,
        title: Text("5. Lottie animation json"),
      ),
      body: Container(
        color: scarlet,
        child: Lottie.asset(
          'assets/animations/nopremio.json',
          width: size.width,
          fit: BoxFit.fitWidth,
          controller: _controller,
          onLoaded: (composition) {
            _controller
              ..duration = composition.duration
              ..forward().then((value) {
                setState(() {
                  _controller.reset();
                });
              });
          },
        ),
      ),
    );
  }
}
