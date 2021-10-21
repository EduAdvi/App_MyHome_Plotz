import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:my_home/Menu/Menu_Agenda.dart';
import 'package:my_home/Menu/Menu_Consumo.dart';
import 'package:my_home/Menu/Menu_Luzes.dart';
import 'package:my_home/Menu/Menu_Pessoas.dart';
import 'package:my_home/Menu/Menu_Trancas.dart';
import 'package:my_home/Menu/Menu_Notas.dart';

void main() {
  runApp(MaterialApp(
      title: 'MyHome',
      home: Login_Screen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        secondaryHeaderColor: Colors.white,
        backgroundColor: Colors.black87,
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 72.0, fontWeight: FontWeight.bold, color: Colors.white),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      )));
}

class Home_Menu extends StatefulWidget {
  const Home_Menu({Key? key}) : super(key: key);

  @override
  _Home_MenuState createState() => _Home_MenuState();
}

class _Home_MenuState extends State<Home_Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('MyHome'),
        actions: [
          Container(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      onSurface: Theme.of(context).primaryColor),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => About_Screen()));
                  },
                  child: Icon(Icons.dehaze)))
        ],
      ),
      body: Container(
          decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
          child: Column(
            children: [
              Container(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Center(
                      child: Text('Funções',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Theme.of(context).secondaryHeaderColor)))),
              //ROW 1
              Container(
                  // Function Menu

                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Menu_Agenda(),
                          Menu_Notas(),
                          Menu_Consumo(),
                          Menu_Luzes(),
                          Menu_Trancas(),
                          Menu_Pessoas(),
                        ],
                      )))
            ],
          )),
    );
  }
}

class Login_Screen extends StatelessWidget {
  const Login_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
        child: Center(
          child: Column(
            children: [
              Center(
                  child: Icon(Icons.home,
                      color: Theme.of(context).secondaryHeaderColor,
                      size: 150)),
              Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: TextField(
                    style: TextStyle(
                        color: Theme.of(context).secondaryHeaderColor),
                    decoration: new InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).secondaryHeaderColor)),
                      border: OutlineInputBorder(),
                      hintText: 'Login',
                      hintStyle: TextStyle(
                          color: Theme.of(context).secondaryHeaderColor),
                    ),
                  )),
              Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: TextField(
                    style: TextStyle(
                        color: Theme.of(context).secondaryHeaderColor),
                    decoration: new InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).secondaryHeaderColor)),
                        border: OutlineInputBorder(),
                        hintText: 'Senha',
                        hintStyle: TextStyle(
                            color: Theme.of(context).secondaryHeaderColor)),
                  )),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                child: Container(
                    width: 200,
                    height: 80,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          onSurface: Theme.of(context).primaryColor),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Home_Menu()));
                      },
                      child: Text('Login'),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class About_Screen extends StatelessWidget {
  const About_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre'),
      ),
      body: Container(
        decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
          child: Center(
              child: Column(
            children: [
              Text(
                'Tema do projeto: Automação Residencial',
                style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
              ),
              Text(
                'Desenvolvedores:',
                style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
              ),
              Text(
                'Eduardo Goulart da Silva Advignolli',
                style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
              ),
              Container(
                  width: 100,
                  height: 100,
                  child: Image.asset(
                    'imagens/foto_eduardo.png',
                  )),
              Text(
                'Gabriel Tavares Santana de Jesus',
                style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
              ),
              Container(
                  width: 100,
                  height: 100,
                  child: Image.asset(
                    'imagens/foto_tavares.png',
                  )),
              Text(
                'O Aplicativo pode ativar e desativar luzes e trancaas, Registrar os moradores da casa e lembralos de anotaçoes e compromissos usando um sistema de som e notificação',
                style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
