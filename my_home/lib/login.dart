import 'dart:html';

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
import 'package:my_home/main.dart';
import 'package:my_home/globals.dart' as globals;

import "package:ini/ini.dart";

class Login_Screen extends StatefulWidget {
  const Login_Screen({Key? key}) : super(key: key);

  @override
  _Login_ScreenState createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  @override
  var TextoNome = TextEditingController();
  var TextoSenha = TextEditingController();
  var TextoEmail = TextEditingController();

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
                    controller: TextoEmail,
                    style: TextStyle(
                        color: Theme.of(context).secondaryHeaderColor),
                    decoration: new InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).secondaryHeaderColor)),
                      border: OutlineInputBorder(),
                      hintText: 'Email',
                      hintStyle: TextStyle(
                          color: Theme.of(context).secondaryHeaderColor),
                    ),
                  )),
              Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: TextField(
                    controller: TextoSenha,
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
                        if (TextoEmail.text != '' && TextoSenha.text != '') {
                          fazer_login(TextoEmail.text, TextoSenha.text);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                Text('Preencha todos os campos para continuar'),
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.red,
                          ));
                        }
                      },
                      child: Text('Login'),
                    )),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                child: Container(
                    width: 200,
                    height: 80,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(onSurface: Colors.green),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Cadastro_Screen()));
                      },
                      child: Text('Cadastrar'),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  void fazer_login(email, senha) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((value) {
      globals.UserUid = value.user!.uid;
      //Deu certo

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Login efetuado'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,
      ));
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => Home_Menu()));
    }).catchError((erro) {
      var mensagem = '';
      if (erro.code == 'user-not-found') {
        mensagem = 'Usuario não encontrado';
      } else if (erro.code == 'wrong-password') {
        mensagem = 'Senha incorreta';
      } else if (erro.code == 'invalid-email') {
        mensagem = 'Email não encontrado';
      } else {
        mensagem = 'Erro: ' + erro.code;
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(mensagem),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ));
    });
  }
}

class Cadastro_Screen extends StatefulWidget {
  const Cadastro_Screen({Key? key}) : super(key: key);

  @override
  _Cadastro_ScreenState createState() => _Cadastro_ScreenState();
}

class _Cadastro_ScreenState extends State<Cadastro_Screen> {
  @override
  var TextoNome = TextEditingController();
  var TextoSenha = TextEditingController();
  var TextoEmail = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
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
                    controller: TextoNome,
                    style: TextStyle(
                        color: Theme.of(context).secondaryHeaderColor),
                    decoration: new InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).secondaryHeaderColor)),
                        border: OutlineInputBorder(),
                        hintText: 'Nome',
                        hintStyle: TextStyle(
                            color: Theme.of(context).secondaryHeaderColor)),
                  )),
              Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: TextField(
                    controller: TextoEmail,
                    style: TextStyle(
                        color: Theme.of(context).secondaryHeaderColor),
                    decoration: new InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).secondaryHeaderColor)),
                      border: OutlineInputBorder(),
                      hintText: 'Email',
                      hintStyle: TextStyle(
                          color: Theme.of(context).secondaryHeaderColor),
                    ),
                  )),
              Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: TextField(
                    controller: TextoSenha,
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
                        if (TextoEmail.text != '' &&
                            TextoSenha.text != '' &&
                            TextoNome.text != '') {
                          criar_conta(
                              TextoNome.text, TextoEmail.text, TextoSenha.text);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                Text('Preencha todos os campos para continuar'),
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.red,
                          ));
                        }
                      },
                      child: Text('Cadastrar'),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  void criar_conta(nome, email, senha) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: senha)
        .then((value) {
      globals.UserUid = value.user!.uid;
      FirebaseFirestore.instance
          .collection('Usuarios_data')
          .doc(value.user!.uid)
          .collection('Informacoes')
          .doc('Id')
          .set({
        'Nome': nome,
        'Email': email,
      }).then((value) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => Login_Screen()));
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Usuario criado, Agora entre com sua conta'),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.green,
        ));

        //Navigator.pop(context);
      });
    }).catchError((erro) {
      if (erro.code == 'email already in use') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Este email já está em uso'),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Erro: ' + erro.message),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
        ));
      }
    });
  }
}
