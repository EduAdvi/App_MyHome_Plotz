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
import 'package:my_home/login.dart';

var UserUid;

var tranca_1 = false, tranca_2 = false, tranca_3 = false, tranca_4 = false;
var light_1 = false, light_2 = false, light_3 = false, light_4 = false;

var consumo_lampada = 1.0;
var consumo_tranca = 1.0;

void update_database() {
  // luz config
  FirebaseFirestore.instance
      .collection('Usuarios_data')
      .doc(UserUid)
      .collection('Luzes_State')
      .doc('conjunto_1')
      .set({
    "luz_1": light_1,
    "luz_2": light_2,
    "luz_3": light_3,
    "luz_4": light_4,
  });
  // tranca config
  FirebaseFirestore.instance
      .collection('Usuarios_data')
      .doc(UserUid)
      .collection('Trancas_State')
      .doc('conjunto_1')
      .set({
    "tranca_1": tranca_1,
    "tranca_2": tranca_2,
    "tranca_3": tranca_3,
    "tranca_4": tranca_4,
  });
}
