import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:my_home/Funcoes/notas_add.dart';
import 'package:my_home/Funcoes/pessoas.dart';
import 'package:my_home/Funcoes/pessoas_widget.dart';
import 'package:my_home/main.dart';
import 'package:my_home/Funcoes/luzes_widget.dart';

import 'package:my_home/globals.dart' as globals;

class Notas_Screen extends StatefulWidget {
  const Notas_Screen({Key? key}) : super(key: key);

  @override
  _Notas_ScreenState createState() => _Notas_ScreenState();
}

class _Notas_ScreenState extends State<Notas_Screen> {
  late CollectionReference notas;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notas = FirebaseFirestore.instance
        .collection('Usuarios_data')
        .doc(globals.UserUid)
        .collection('tabela_notas');
  }

  Widget nota_lista(item) {
    String Titulo = item.data()['nome'];
    String Lembrete = item.data()['lembrete'];

    return ListTile(
      leading: Icon(
        Icons.note,
        color: Theme.of(context).secondaryHeaderColor,
        size: 45,
      ),
      focusColor: Theme.of(context).backgroundColor,
      title: Text(Titulo,
          style: TextStyle(
              fontSize: 30, color: Theme.of(context).secondaryHeaderColor)),
      subtitle: Text(Lembrete,
          style: TextStyle(
              fontSize: 20, color: Theme.of(context).secondaryHeaderColor)),
      trailing: IconButton(
        icon: Icon(
          Icons.delete,
          color: Colors.white,
        ),
        onPressed: () {
          //
          notas.doc(item.id).delete();
          //
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notas')),
      body: Container(
          decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
          child: StreamBuilder<QuerySnapshot>(
            stream: notas.snapshots(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Center(
                      child: Text("não foi possivel se conectar"));
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                default:
                  final dados = snapshot.requireData;
                  return ListView.builder(
                    itemCount: dados.size,
                    itemBuilder: (context, index) {
                      return nota_lista(dados.docs[index]);
                    },
                  );
              }
            },
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Puxar tela de input de dados.
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => Notas_Add()));
        },
        child: const Icon(Icons.note_add),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
