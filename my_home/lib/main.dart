import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth_web/firebase_auth_web.dart';

import 'package:flutter/foundation.dart';
import 'package:my_home/Menu/Menu_Agenda.dart';
import 'package:my_home/Menu/Menu_Consumo.dart';
import 'package:my_home/Menu/Menu_Luzes.dart';
import 'package:my_home/Menu/Menu_Pessoas.dart';
import 'package:my_home/Menu/Menu_Trancas.dart';
import 'package:my_home/Menu/Menu_Notas.dart';
import 'package:my_home/login.dart';
import 'package:my_home/globals.dart' as globals;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
    print(globals.UserUid);
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
                'O Aplicativo pode ativar e desativar luzes e trancas, Registrar os moradores da casa e lembra-los de anotaçoes e compromissos usando um sistema de som e notificação',
                style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
