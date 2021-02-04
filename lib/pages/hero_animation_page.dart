import 'package:animaciones_app/helpers/media_size.dart';
import 'package:animaciones_app/styles/colors.dart';
import 'package:flutter/material.dart';

class HeroAnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = getMediaSize(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: iris,
        title: Text("Hero Animation"),
      ),
      backgroundColor: blueBell,
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getRoundedWidget(
              "thor",
              size,
              "https://indiehoy.com/wp-content/uploads/2020/05/thor.jpg",
              () {},
            ),
            getRoundedWidget(
              "spiderman",
              size,
              "https://cronicaglobal.elespanol.com/uploads/s1/61/11/50/7/main-700b9bff30.jpeg",
              () {},
            ),
            getRoundedWidget(
              "han",
              size,
              "https://i2.wp.com/wipy.tv/wp-content/uploads/2020/03/verdadera-apariencia-de-han-solo-en-star-wars.jpg?w=1000&ssl=1",
              () {},
            )
          ],
        ),
      ),
    );
  }

  Widget getRoundedWidget(
      String key, Size size, String imgUrl, Function openView) {
    return Stack(
      children: [
        ClipOval(
          child: Container(
            width: size.height * 0.25,
            height: size.height * 0.25,
            child: Hero(
              tag: key,
              child: Image(
                image: NetworkImage(imgUrl),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
        ClipOval(
          child: Material(
            color: transparent,
            child: InkWell(
              onTap: openView,
              child: Container(
                width: size.height * 0.25,
                height: size.height * 0.25,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
