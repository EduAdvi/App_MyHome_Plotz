import 'package:flutter/material.dart';
import 'package:my_home/globals.dart' as globals;
import 'package:my_home/main.dart';

import 'package:pie_chart/pie_chart.dart';

class Consumo_Screen extends StatefulWidget {
  const Consumo_Screen({Key? key}) : super(key: key);

  @override
  _Consumo_ScreenState createState() => _Consumo_ScreenState();
}

class _Consumo_ScreenState extends State<Consumo_Screen> {
  //double consumo_l = globals.consumo_lampada.toDouble();
  Map<String, double> dataMap = {
    "Lampadas": globals.consumo_lampada,
    "Trancas": globals.consumo_tranca,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Consumo')),
      body: Container(
          decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
          child: Center(
            child: Column(
              children: [
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Center(
                        child: Container(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 100, 20, 0),
                            child: PieChart(
                              dataMap: dataMap,
                              animationDuration: Duration(milliseconds: 800),
                              chartLegendSpacing: 32,
                              chartRadius:
                                  MediaQuery.of(context).size.width / 3.2,
                              //colorList: colorList,
                              initialAngleInDegree: 0,
                              chartType: ChartType.ring,
                              ringStrokeWidth: 32,
                              centerText: "Consumo",
                              legendOptions: LegendOptions(
                                showLegendsInRow: false,
                                legendPosition: LegendPosition.right,
                                showLegends: true,
                                legendShape: BoxShape.circle,
                                legendTextStyle: TextStyle(
                                  color: Theme.of(context).secondaryHeaderColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              chartValuesOptions: ChartValuesOptions(
                                showChartValueBackground: true,
                                showChartValues: true,
                                showChartValuesInPercentage: true,
                                showChartValuesOutside: false,
                                decimalPlaces: 1,
                              ),
                              // gradientList: ---To add gradient colors---
                              // emptyColorGradient: ---Empty Color gradient---
                            ))))
              ],
            ), //
          )),
    );
  }
}
