import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:my_home/Funcoes/luzes.dart';

class Luz_botao extends StatefulWidget {
  final String nome_luz;
  const Luz_botao(
    this.nome_luz, {
    Key? key,
  }) : super(key: key);

  @override
  _Luz_botaoState createState() => _Luz_botaoState();
}

class _Luz_botaoState extends State<Luz_botao> {
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
                    estado = !estado;
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
