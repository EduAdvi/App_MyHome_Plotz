import 'dart:html';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:my_home/Funcoes/notas.dart';
import 'package:my_home/Funcoes/pessoas.dart';

import 'package:my_home/globals.dart' as globals;

class Pessoas_add_Screen extends StatefulWidget {
  const Pessoas_add_Screen({Key? key}) : super(key: key);

  @override
  _Pessoas_add_ScreenState createState() => _Pessoas_add_ScreenState();
}

class _Pessoas_add_ScreenState extends State<Pessoas_add_Screen> {
  var txtLembrete = TextEditingController();
  var txtHorario = TextEditingController();

  void erro() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Erro'),
          content: Text('Digite pelo menos um Nome para a pessoa'),
        );
      },
    );
  }

  void erro_net() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Erro'),
          content: Text('Rede não disponivel'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //txtLembrete.text = "Titulo";
    //txtHorario.text = "Padrao";
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar'),
      ),
      body: Container(
        decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
          child: Center(
              child: Column(
            children: [
              Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: TextField(
                    controller: txtHorario,
                    style: TextStyle(
                        color: Theme.of(context).secondaryHeaderColor),
                    decoration: new InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).secondaryHeaderColor)),
                      border: OutlineInputBorder(),
                      hintText: 'Nome',
                      hintStyle: TextStyle(
                          color: Theme.of(context).secondaryHeaderColor),
                    ),
                  )),

              ///
              Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: TextField(
                    //controller: txtLembrete,
                    controller: txtLembrete,
                    style: TextStyle(
                        color: Theme.of(context).secondaryHeaderColor),
                    decoration: new InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).secondaryHeaderColor)),
                      border: OutlineInputBorder(),
                      hintText: 'Idade',
                      hintStyle: TextStyle(
                          color: Theme.of(context).secondaryHeaderColor),
                    ),
                  )),
              //
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                child: Container(
                    width: 200,
                    height: 80,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          onSurface: Theme.of(context).primaryColor),
                      onPressed: () {
                        print(txtHorario.text);
                        if (txtHorario.text != "") {
                          ///////////ADICIONAR firebase//////////////
                          FirebaseFirestore.instance
                              .collection('Usuarios_data')
                              .doc(globals.UserUid)
                              .collection("pessoas")
                              .add({
                            "nome": txtHorario.text,
                            "idade": txtLembrete.text
                          });

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Pessoas_Screen()));
                        } else {
                          erro();
                        }
                      },
                      child: Text('Adicionar'),
                    )),
              )
            ],
          )),
        ),
      ),
    );
  }
}
