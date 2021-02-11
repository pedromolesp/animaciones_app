import 'package:animaciones_app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

getFloatingActionButtonNext(BuildContext context, Size size, String route,
    {Color color}) {
  return FloatingActionButton(
    backgroundColor: color != null ? color : Colors.blue,
    onPressed: () {
      Navigator.pushNamed(context, route);
    },
    child: SvgPicture.asset(
      "assets/images/flecha_avanzar.svg",
      color: white,
    ),
  );
}
