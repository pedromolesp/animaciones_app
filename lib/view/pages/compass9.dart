import 'package:animaciones_app/helpers/media_size.dart';
import 'package:animaciones_app/styles/colors.dart';
import 'package:animaciones_app/view/widgets/floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:compasstools/compasstools.dart';

class CompassAnimation extends StatefulWidget {
  @override
  _CompassAnimationState createState() => _CompassAnimationState();
}

class _CompassAnimationState extends State<CompassAnimation> {
  int _haveSensor;
  String sensorType;

  @override
  void initState() {
    super.initState();
    checkDeviceSensors();
  }

  Future<void> checkDeviceSensors() async {
    String sensorType;

    int haveSensor;

    try {
      haveSensor = await Compasstools.checkSensors;

      switch (haveSensor) {
        case 0:
          {
            sensorType = "No sensors for compass!";
          }
          break;

        case 1:
          {
            sensorType = "Accelerometer + Magnetometer!";
          }
          break;

        case 2:
          {
            sensorType = "Gyroscope!";
          }
          break;

        default:
          {
            sensorType = "Error!";
          }
          break;
      }
    } on Exception {}
    if (!mounted) return;

    setState(() {
      _haveSensor = haveSensor;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = getMediaSize(context);
    return Scaffold(
      floatingActionButton:
          getFloatingActionButtonNext(context, size, 'clippers'),
      appBar: AppBar(
        backgroundColor: dutchwhite,
        title: const Text('9. Brújula'),
      ),
      body: new Container(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              child: Container(
                width: size.width,
                height: size.height,
                child: Image.asset(
                  "assets/images/treasure.jpeg",
                  width: size.width + 200,
                  height: size.height * 1.3,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            StreamBuilder(
              stream: Compasstools.azimuthStream,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: EdgeInsets.all(20),
                    child: Center(
                        child: new RotationTransition(
                      turns: new AlwaysStoppedAnimation(-snapshot.data / 360),
                      child: Image.asset("assets/images/compass.png"),
                    )),
                  );
                } else
                  return Text("Error in stream!");
              },
            ),
          ],
        ),
      ),
    );
  }
}
