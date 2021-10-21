import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:my_home/Funcoes/luzes.dart';

class Pessoas_botao extends StatefulWidget {
  final String nome_luz;
  const Pessoas_botao(
    this.nome_luz, {
    Key? key,
  }) : super(key: key);

  @override
  _Pessoas_botaoState createState() => _Pessoas_botaoState();
}

class _Pessoas_botaoState extends State<Pessoas_botao> {
  bool estado = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
        child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.people,
                  size: 100,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
                Text(
                  widget.nome_luz,
                  style:
                      TextStyle(color: Theme.of(context).secondaryHeaderColor),
                )
              ],
            )));
  }
}
