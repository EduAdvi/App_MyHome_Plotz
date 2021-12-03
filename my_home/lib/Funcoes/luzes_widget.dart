import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:my_home/Funcoes/luzes.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:my_home/globals.dart' as globals;

class Luz_botao extends StatefulWidget {
  final String nome_luz;
  final String cod_luz;
  const Luz_botao(
    this.nome_luz,
    this.cod_luz, {
    Key? key,
  }) : super(key: key);

  @override
  _Luz_botaoState createState() => _Luz_botaoState();
}

class _Luz_botaoState extends State<Luz_botao> {
  bool estado = false;
  //    .collection('Usuarios_data')
  //   .doc(globals.UserUid)
  //    .collection('Trancas_State')
  //   .doc('conjunto_1')
  //    .get(widget.cod_luz)
  //    .toString();

  @override
  Widget build(BuildContext context) {
    if (widget.cod_luz == "luz_1") {
      estado = globals.light_1;
    } else if (widget.cod_luz == "luz_2") {
      estado = globals.light_2;
    } else if (widget.cod_luz == "luz_3") {
      estado = globals.light_3;
    } else if (widget.cod_luz == "luz_4") {
      estado = globals.light_4;
    }
    return Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10, 20, 0, 0),
        child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    estado = !estado;
                    globals.consumo_lampada += 1;
                    if (widget.cod_luz == "luz_1") {
                      globals.light_1 = estado;
                    } else if (widget.cod_luz == "luz_2") {
                      globals.light_2 = estado;
                    } else if (widget.cod_luz == "luz_3") {
                      globals.light_3 = estado;
                    } else if (widget.cod_luz == "luz_4") {
                      globals.light_4 = estado;
                    }
                    globals.update_database();
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary:
                      (estado ? Theme.of(context).primaryColor : Colors.yellow),
                  //COR QUE TEM QUE MUDAR
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Icon(
                          Icons.light,
                          color: Theme.of(context).secondaryHeaderColor,
                          size: 50,
                          semanticLabel:
                              'Text to announce in accessibility modes',
                        )),
                    Text(
                      widget.nome_luz, // ============== O NOME -----------
                      style: TextStyle(
                          color: Theme.of(context).secondaryHeaderColor),
                    )
                  ],
                ))));
  }
}
