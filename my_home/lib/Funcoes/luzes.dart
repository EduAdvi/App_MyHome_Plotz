import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:my_home/Funcoes/pessoas_widget.dart';
import 'package:my_home/main.dart';
import 'package:my_home/Funcoes/luzes_widget.dart';

class Luzes_Screen extends StatefulWidget {
  const Luzes_Screen({Key? key}) : super(key: key);

  @override
  _Luzes_ScreenState createState() => _Luzes_ScreenState();
}

class _Luzes_ScreenState extends State<Luzes_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Luzes')),
      body: Container(
          decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
          child: Row(
            children: [
              Column(
                children: [
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Luz_botao('Sala'),
                          Luz_botao('Quarto'),
                          Luz_botao('Banheiro'),
                          Luz_botao('Cozinha'),
                        ],
                      ))
                ],
              ), //
            ],
          )),
    );
  }
}

Widget Botao_luz(bool estado) {
  if (estado == false) {
    return Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10, 20, 0, 0),
        child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
                child: ElevatedButton(
                    onPressed: () {
                      if (estado == true) {
                        estado = false;
                      } else {
                        estado = true;
                      }
                      Botao_luz(estado);
                      print(estado);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                              size: 50,
                              semanticLabel:
                                  'Text to announce in accessibility modes',
                            )),
                        Text('Agenda',
                            style: TextStyle(
                              color: Colors.white,
                            ))
                      ],
                    )))));
  } else {
    return Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10, 20, 0, 0),
        child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
                child: ElevatedButton(
                    onPressed: () {
                      if (estado == true) {
                        estado = false;
                      } else {
                        estado = true;
                      }
                      Botao_luz(estado);
                      print(estado);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.yellow,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 20, 0),
                            child: Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                              size: 50,
                              semanticLabel:
                                  'Text to announce in accessibility modes',
                            )),
                        Text('Agenda',
                            style: TextStyle(
                              color: Colors.white,
                            ))
                      ],
                    )))));
  }
}
