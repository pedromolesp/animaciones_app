import 'package:animaciones_app/helpers/media_size.dart';
import 'package:animaciones_app/styles/colors.dart';
import 'package:animaciones_app/view/widgets/floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
        backgroundColor: scarlet,
        title: Text("5. Lottie animation json"),
      ),
      body: Container(
        color: scarlet,
        child: Stack(
          children: [
            Positioned(
                top: size.height * 0.1,
                width: size.width,
                child: Center(
                    child: SvgPicture.asset("assets/images/laruleta.svg"))),
            Lottie.asset(
              'assets/animations/nopremio.json',
              width: size.width,
              fit: BoxFit.fitWidth,
              controller: _controller,
              onLoaded: (composition) {
                _controller
                  ..duration = composition.duration
                  ..forward().then(
                    (value) {
                      setState(() {
                        _controller.repeat();
                      });
                    },
                  );
              },
            ),
            Positioned(
              width: size.width,
              bottom: 0,
              child: Center(
                child: getFloatingActionButtonNext(context, size, "animated"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
