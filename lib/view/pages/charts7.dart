import 'package:animaciones_app/helpers/media_size.dart';
import 'package:animaciones_app/styles/colors.dart';
import 'package:animaciones_app/styles/fonts.dart';
import 'package:animaciones_app/view/widgets/floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = getMediaSize(context);
    return Scaffold(
      floatingActionButton: getFloatingActionButtonNext(
          context, size, 'sensors',
          color: independence),
      backgroundColor: yonder,
      appBar: AppBar(
        backgroundColor: independence,
        title: Text("7. Charts "),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Container(
              width: size.height * 0.4,
              height: size.height * 0.4,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  BalanceDonutChart(
                    linearProgress: [
                      LinearProgress(70.0, ""),
                      LinearProgress(100.0 - 70.0, "total"),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "70%",
                        style: TextStyle(
                            color: white,
                            fontSize: size.width * 0.04,
                            fontFamily: Fonts.muliBold),
                      ),
                      Text(
                        "Ahorro",
                        style: TextStyle(
                            color: white,
                            fontSize: size.width * 0.04,
                            fontFamily: Fonts.muliBold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: size.height * 0.4,
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
              child: SimpleBarChart(
                animate: true,
                consumptions: [
                  Consumption(
                      matricula: "3869GLK", porcentaje: 20.0, volume: 50),
                  Consumption(
                      matricula: "3868GLK", porcentaje: 20.0, volume: 50),
                  Consumption(
                      matricula: "3867GLK", porcentaje: 20.0, volume: 50),
                  Consumption(
                      matricula: "3866GLK", porcentaje: 40.0, volume: 100),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BalanceDonutChart extends StatelessWidget {
  List<LinearProgress> linearProgress;
  BalanceDonutChart({this.linearProgress});

  @override
  Widget build(BuildContext context) {
    return charts.PieChart(
      _createData(linearProgress),
      animate: true,
      defaultInteractions: false,
      animationDuration: Duration(milliseconds: 500),
      defaultRenderer: new charts.ArcRendererConfig(
          arcWidth: (30).truncate(), strokeWidthPx: 0.0),
    );
  }

  static List<charts.Series<LinearProgress, double>> _createData(
    List<LinearProgress> linearProgress,
  ) {
    return [
      new charts.Series<LinearProgress, double>(
        id: 'progress',
        domainFn: (LinearProgress progress, _) => progress.progress,
        measureFn: (LinearProgress progress, _) => progress.progress,
        colorFn: (progress, i) {
          if (progress.type == "total") {
            return charts.ColorUtil.fromDartColor(black.withOpacity(0.2));
          } else {
            return charts.ColorUtil.fromDartColor(scarlet);
          }
        },
        seriesColor: charts.ColorUtil.fromDartColor(scarlet),
        insideLabelStyleAccessorFn: (LinearProgress progress, _) =>
            charts.TextStyleSpec(fontSize: 0),
        data: linearProgress,
      )
    ];
  }
}

class LinearProgress {
  final double progress;
  final String type;

  LinearProgress(this.progress, this.type);
}

class SimpleBarChart extends StatelessWidget {
  final bool animate;
  List<Consumption> consumptions;

  SimpleBarChart({this.animate, this.consumptions});

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      _createData(consumptions),
      animate: animate,
      vertical: false,
      defaultInteractions: true,
      barRendererDecorator: new charts.BarLabelDecorator<String>(),
      defaultRenderer: new charts.BarRendererConfig(
        fillPattern: charts.FillPatternType.solid,
        //customRendererId: "id",
        barRendererDecorator: charts.BarLabelDecorator(
            labelPosition: charts.BarLabelPosition.auto,
            labelAnchor: charts.BarLabelAnchor.end),
        cornerStrategy: const charts.ConstCornerStrategy(5),
      ),
      primaryMeasureAxis: charts.AxisSpec(
        showAxisLine: true,
        tickProviderSpec: charts.BasicNumericTickProviderSpec(
            desiredMaxTickCount: 100,
            desiredMinTickCount: 6,
            desiredTickCount: 100),
        tickFormatterSpec: charts.BasicNumericTickFormatterSpec(
          (_) {
            return "${_.truncate()}%";
          },
        ),
      ),
    );
  }

  static List<charts.Series<OrdinalAmount, String>> _createData(
      List<Consumption> consumptions) {
    final List<OrdinalAmount> data = [];
    consumptions.forEach((item) {
      if (item.porcentaje > 0.0) {
        data.add(OrdinalAmount(item.matricula, item.porcentaje.truncate()));
      }
    });
    final color = charts.ColorUtil.fromDartColor(iris);
    final black = charts.ColorUtil.fromDartColor(white);
    return [
      new charts.Series<OrdinalAmount, String>(
        id: 'amount',
        colorFn: (_, __) => color,
        domainFn: (OrdinalAmount amount, _) => amount.matricula,
        measureFn: (OrdinalAmount amount, _) => amount.amount,
        displayName: "nombre",
        labelAccessorFn: (OrdinalAmount amount, _) {
          return '${amount.amount}%';
        },
        insideLabelStyleAccessorFn: (OrdinalAmount sales, _) {
          return new charts.TextStyleSpec(
              color: black, fontFamily: Fonts.muliBold);
        },
        outsideLabelStyleAccessorFn: (OrdinalAmount sales, _) {
          return new charts.TextStyleSpec(
              color: color, fontFamily: Fonts.muliBold);
        },
        data: data,
      )..setAttribute(charts.measureAxisIdKey, 'secondaryMeasureAxisId'),
    ];
  }
}

class OrdinalAmount {
  final String matricula;
  final int amount;

  OrdinalAmount(this.matricula, this.amount);
}

class Consumption {
  String matricula;
  double volume;
  double porcentaje;

  Consumption({this.matricula, this.porcentaje, this.volume});

  Consumption.fromJson(Map<String, dynamic> json) {
    matricula = json['matricula'];
    porcentaje = json['porcentaje'] / 1.0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['matricula'] = this.matricula;
    data['porcentaje'] = this.porcentaje;
    return data;
  }
}

class Consumptions {
  List<Consumption> items = new List();

  Consumptions();

  Consumptions.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final consumption = new Consumption.fromJson(item);
      items.add(consumption);
    }
  }
}
