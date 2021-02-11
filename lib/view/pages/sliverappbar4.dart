import 'package:animaciones_app/helpers/media_size.dart';
import 'package:animaciones_app/styles/colors.dart';
import 'package:animaciones_app/styles/fonts.dart';
import 'package:animaciones_app/view/widgets/floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SliverBarView extends StatefulWidget {
  @override
  _SliverBarViewState createState() => _SliverBarViewState();
}

class _SliverBarViewState extends State<SliverBarView> {
  ScrollController controller;
  bool extended;
  @override
  void initState() {
    super.initState();
    extended = true;
    controller = new ScrollController();
    controller.addListener(() {
      if (controller.position.pixels > 50) {
        setState(() {
          extended = false;
        });
      } else {
        setState(() {
          extended = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> nombres = [
      "Pedro",
      "José",
      "Pepa",
      "Maricarmen",
      "Federico",
      "Martina",
      "Alfonso",
      "Fairouz",
      "Isabel"
    ];
    Size size = getMediaSize(context);
    return Container(
      width: size.width,
      height: size.height,
      color: white,
      child: CustomScrollView(
        controller: controller,
        slivers: [
          SliverAppBar(
            elevation: 2,
            floating: true,
            pinned: true,
            expandedHeight: size.height * 0.3,
            actions: [],
            title: Text("4. Sliver y CustomScroll"),
            flexibleSpace: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    offset: Offset(0.0, 8.0),
                    color: black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 0.1)
              ]),
              height: size.height * 0.3,
              width: size.width,
              child: Stack(
                children: [
                  Image(
                    image: AssetImage(
                      "assets/images/landscape.jpeg",
                    ),
                    height: size.height * 0.3,
                    width: size.width,
                    fit: BoxFit.fill,
                  ),
                  Container(
                    height: size.height * 0.3,
                    width: size.width,
                    color: black.withOpacity(0.2),
                  ),
                  Positioned(
                    right: size.width * 0.05,
                    bottom: size.height * 0.02,
                    child: AnimatedOpacity(
                        duration: Duration(
                          milliseconds: 200,
                        ),
                        opacity: extended ? 1.0 : 0.0,
                        child: getFloatingActionButtonNext(
                            context, size, "lottie",
                            color: Colors.cyan.withOpacity(0.4))),
                  )
                ],
              ),
            ),
            backgroundColor: white,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    color: Colors.cyan.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(40),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(40),
                      onTap: () {
                        Fluttertoast.showToast(
                          msg: "Hola, soy ${nombres[index]}",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIos: 2,
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            vertical: size.height * 0.02,
                            horizontal: size.width * 0.05),
                        decoration: BoxDecoration(
                            color: Colors.cyan.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(40)),
                        width: size.width * 0.9,
                        height: size.height * 0.1,
                        child: Row(
                          children: [
                            ClipOval(
                              child: Image.asset("assets/images/gato.jpg"),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  nombres[index],
                                  style: TextStyle(
                                      color: black,
                                      fontFamily: Fonts.muliBlack,
                                      decoration: TextDecoration.none,
                                      fontSize: size.width * 0.05),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              childCount: nombres.length,
            ),
          ),
        ],
      ),
    );
  }
}
