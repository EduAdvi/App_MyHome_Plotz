import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:my_home/Funcoes/notas.dart';

class Menu_Notas extends StatefulWidget {
  const Menu_Notas({Key? key}) : super(key: key);

  @override
  _Menu_NotasState createState() => _Menu_NotasState();
}

class _Menu_NotasState extends State<Menu_Notas> {
  void _exibir() async {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => Notas_Screen()));
  }

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
                  _exibir();
                },
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context)
                      .primaryColor, //Theme.of(context).primaryColor,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Icon(
                          Icons.note,
                          color: Theme.of(context).secondaryHeaderColor,
                          size: 50,
                          semanticLabel:
                              'Text to announce in accessibility modes',
                        )),
                    Text(
                      'Notas',
                      style: TextStyle(
                          color: Theme.of(context).secondaryHeaderColor),
                    )
                  ],
                ))));
  }
}
