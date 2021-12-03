import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:my_home/Funcoes/consumo.dart';
import 'package:my_home/Funcoes/luzes.dart';

class Menu_Consumo extends StatefulWidget {
  const Menu_Consumo({Key? key}) : super(key: key);

  @override
  _Menu_ConsumoState createState() => _Menu_ConsumoState();
}

class _Menu_ConsumoState extends State<Menu_Consumo> {
  void _exibir() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Em breve'),
          content: Text('Este recurso sera desenvolvido em breve'),
        );
      },
    );
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Consumo_Screen()));
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
                          Icons.electrical_services,
                          color: Theme.of(context).secondaryHeaderColor,
                          size: 50,
                          semanticLabel:
                              'Text to announce in accessibility modes',
                        )),
                    Text(
                      'Consumo',
                      style: TextStyle(
                          color: Theme.of(context).secondaryHeaderColor),
                    )
                  ],
                ))));
  }
}
