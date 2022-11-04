
import 'package:f_template_juego_taller1/ui/pages/AddCuenta.dart';
import 'package:f_template_juego_taller1/ui/pages/AddTarjeta.dart';
import 'package:f_template_juego_taller1/ui/pages/AddTarjeta2.dart';
import 'package:f_template_juego_taller1/ui/pages/CuentasG.dart';
import 'package:f_template_juego_taller1/ui/pages/GestionarMP.dart';
import 'package:f_template_juego_taller1/ui/pages/InicioPage.dart';
import 'package:f_template_juego_taller1/ui/pages/RPagos.dart';
import 'package:f_template_juego_taller1/ui/pages/RegistroTran.dart';
import 'package:f_template_juego_taller1/ui/pages/TarjetasG.dart';
import 'package:f_template_juego_taller1/ui/pages/homepage.dart';
import 'package:f_template_juego_taller1/ui/pages/login.dart';
import 'package:f_template_juego_taller1/ui/pages/registro.dart';
import 'package:f_template_juego_taller1/ui/pages/registro2.dart';
import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';

void main() {
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(
      showColors: true,
    ),
  );
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "RandomWords",
      home: HomePageWidget()));
}
