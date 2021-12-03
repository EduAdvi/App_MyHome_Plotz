import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:my_home/Funcoes/luzes.dart';
import 'package:my_home/globals.dart' as globals;

class Tranca_botao extends StatefulWidget {
  final String nome_Tranca;
  const Tranca_botao(
    this.nome_Tranca, {
    Key? key,
  }) : super(key: key);

  @override
  _Tranca_botaoState createState() => _Tranca_botaoState();
}

class _Tranca_botaoState extends State<Tranca_botao> {
  bool estado = true;
  @override
  Widget build(BuildContext context) {
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
                    globals.consumo_tranca += 1;
                    estado = !estado;
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
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
                          (estado ? Icons.lock : Icons.lock_open),
                          color: Theme.of(context).secondaryHeaderColor,
                          size: 50,
                          semanticLabel:
                              'Text to announce in accessibility modes',
                        )),
                    Text(
                      widget.nome_Tranca, // ============== O NOME -----------
                      style: TextStyle(
                          color: Theme.of(context).secondaryHeaderColor),
                    )
                  ],
                ))));
  }
}
