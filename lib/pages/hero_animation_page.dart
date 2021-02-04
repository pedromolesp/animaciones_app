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
              "spiderman",
              size,
              "https://cronicaglobal.elespanol.com/uploads/s1/61/11/50/7/main-700b9bff30.jpeg",
              () {
                getAlert(size, context);
              },
            ),
            getRoundedWidget(
              "han",
              size,
              "https://i2.wp.com/wipy.tv/wp-content/uploads/2020/03/verdadera-apariencia-de-han-solo-en-star-wars.jpg?w=1000&ssl=1",
              () {},
            ),
            getRoundedWidget(
              "thor",
              size,
              "https://indiehoy.com/wp-content/uploads/2020/05/thor.jpg",
              () {
                Navigator.pushNamed(context, "detailhero");
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget getRoundedWidget(
      String key, Size size, String imgUrl, Function openView) {
    return Stack(
      children: [
        Container(
          width: size.height * 0.25,
          height: size.height * 0.25,
          child: Hero(
            tag: key,
            child: ClipOval(
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

  void getAlert(Size size, BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: white,
            ),
            height: size.height * 0.75,
            width: size.width * 0.9,
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.1, vertical: size.height * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: size.height * 0.06,
                  height: size.height * 0.06,
                  child: Hero(
                    tag: "spiderman",
                    child: ClipOval(
                      child: Image(
                        image: NetworkImage(
                            "https://cronicaglobal.elespanol.com/uploads/s1/61/11/50/7/main-700b9bff30.jpeg"),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  'Spiderman reposta en Petroprix',
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: size.width * 0.07,
                    color: black,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    getButtonBackAlert(size, context),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  getButtonBackAlert(Size size, BuildContext context) {
    return Center(
      child: Container(
        height: size.height * 0.065,
        width: size.width * 0.27,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: iris,
        ),
        margin: EdgeInsets.only(top: size.height * 0.03),
        child: Material(
          borderRadius: BorderRadius.circular(30),
          color: iris,
          child: InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.height * 0.01,
              ),
              child: Center(
                child: Text(
                  "Volver",
                  style: TextStyle(
                    color: white,
                    fontSize: size.width * 0.045,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DetailHeroAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = getMediaSize(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: iris,
        title: Text("Hero Animation Detail"),
      ),
      backgroundColor: blueBell,
      body: Container(
        width: size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: size.height * 0.05, horizontal: size.width * 0.1),
          child: Column(
            children: [
              Container(
                width: size.height * 0.25,
                height: size.height * 0.25,
                child: Hero(
                  tag: "thor",
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image(
                      image: NetworkImage(
                          "https://indiehoy.com/wp-content/uploads/2020/05/thor.jpg"),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Text(
                "Thor reposta en Petroprix",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
