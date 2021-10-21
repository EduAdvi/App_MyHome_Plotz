import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:my_home/Funcoes/pessoas_widget.dart';
import 'package:my_home/main.dart';

class Pessoas_Screen extends StatefulWidget {
  const Pessoas_Screen({Key? key}) : super(key: key);

  @override
  _Pessoas_ScreenState createState() => _Pessoas_ScreenState();
}

class _Pessoas_ScreenState extends State<Pessoas_Screen> {
  var pessoas = [];

  @override
  void initState() {
    pessoas.add('Pessoa 1');
    pessoas.add('Pessoa ' + (pessoas.length + 1).toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pessoas')),
      body: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
          ),
          child: Center(
              child: Container(
                  width: 500,
                  decoration:
                      BoxDecoration(color: Theme.of(context).backgroundColor),
                  child: ListView.builder(
                      itemCount: pessoas.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Pessoas_botao(pessoas[index]),
                        );
                      })))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            pessoas.add('Pessoa ' + (pessoas.length + 1).toString());
            print('Adicionei');
          });
        },
        child: const Icon(Icons.plus_one),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
