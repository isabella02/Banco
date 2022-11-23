import 'dart:convert';
import 'dart:core';
import 'package:f_template_juego_taller1/ui/pages/InicioPage.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RPagosWidget extends StatefulWidget {
  const RPagosWidget({Key? key}) : super(key: key);

  @override
  _RPagosWidgetState createState() => _RPagosWidgetState();
}

class _RPagosWidgetState extends State<RPagosWidget> {
  String? dropDownValue1;
  String? dropDownValue2;
  String? dropDownValue3;
  String? dropDownValue4;
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String? selectedValue4;

  Future<String> getsesion() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var counter = prefs.getString('usuario') ?? 0;
    String wenas = 'hola';
    return counter as String;
  }

  List lista = [];

  Future cuentas() async {
    var respuesta;
    var url = "http://localhost:8080/eduwallet/consultatarjeta.php";
    var response =
        await http.post(Uri.parse(url), body: {"username": await getsesion()});
    setState(() {
      respuesta = json.decode(response.body);
      lista = respuesta['data'];
    });
    pintarcuentas();
  }

  Map<String, String> listarcuentam = Map();

  void pintarcuentas() {
    for (var i = 0; i < lista.length; i++) {
      listarcuentam[lista[i]['idtarjeta']] = lista[i]['ncuenta'];
    }
    print(listarcuentam);
    //selectedValue = listarcuentam[lista[0]['idtarjeta']];
  }

  @override
  void initState() {
    cuentas();
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  final List<String> Conceptos = [
    'Certificado de estudio',
    'Matricula',
    'Excedente',
  ];
  final List<String> Sedes = [
    'Barranquilla',
    'Cartagena',
    'Medellin',
    'Sincelejo',
    'Santa Marta',
  ];
  final List<String> Metodos = [
    'Tarjeta de Credito',
    'Tarjeta debito',
  ];
  final List<String> Tarjetas = [
    'ejemplo:Masrter card 21551',
  ];
  String? selectedValue;
  String? concepto;
  String? selectedValue2;
  String? sede;
  String? selectedValue3;
  String? metodo;
  String? tarjeta;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Color(0xFFF3F2F5),
          automaticallyImplyLeading: false,
          title: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(50, 0, 0, 20),
            child: Text(
              'EduWallet',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Color(0xFF121013),
                fontSize: 50,
              ),
            ),
          ),
          actions: [],
          centerTitle: false,
          toolbarHeight: 100,
          elevation: 2,
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: 9000,
          height: 692,
          decoration: BoxDecoration(
            color: Color(0xFF8099E6),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.network(
                'https://w0.peakpx.com/wallpaper/899/2/HD-wallpaper-light-blue-to-purple-gradient.jpg',
              ).image,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(50, 50, 0, 0),
                child: Container(
                  width: 800,
                  height: 600,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            child: Ink(
                              decoration: const ShapeDecoration(
                                color: Colors.lightBlue,
                                shape: CircleBorder(),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.chevron_left,
                                  color: Color.fromARGB(255, 84, 81, 91),
                                  size: 30,
                                ),
                                color: Colors.white,
                                onPressed: () async {
                                  //context.pop();
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(180, 50, 0, 0),
                            child: Text(
                              'Realizar Pago',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 37,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        height: 20,
                        thickness: 2,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(50, 10, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            DecoratedBox(
                              decoration: ShapeDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1.0,
                                      style: BorderStyle.solid,
                                      color: Color.fromARGB(255, 37, 37, 37)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(50, 0, 0, 0),
                                child: DropdownButton<String>(
                                  value: selectedValue,
                                  hint: Text(
                                    'Concepto',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Theme.of(context).hintColor,
                                    ),
                                  ),
                                  onChanged: (val) =>
                                      setState(() => concepto = val),
                                  items:
                                      Conceptos.map<DropdownMenuItem<String>>(
                                          (String value) =>
                                              DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              )).toList(),

                                  // add extra sugar..
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconSize: 42,
                                  underline: SizedBox(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(50, 30, 45, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            DecoratedBox(
                              decoration: ShapeDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1.0,
                                      style: BorderStyle.solid,
                                      color: Color.fromARGB(255, 37, 37, 37)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(50, 0, 0, 0),
                                child: DropdownButton<String>(
                                  value: selectedValue2,
                                  hint: Text(
                                    'Sede',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Theme.of(context).hintColor,
                                    ),
                                  ),
                                  onChanged: (val) =>
                                      setState(() => sede = val),
                                  items: Sedes.map<DropdownMenuItem<String>>(
                                      (String value) =>
                                          DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          )).toList(),

                                  // add extra sugar..
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconSize: 42,
                                  underline: SizedBox(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(50, 30, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            DecoratedBox(
                              decoration: ShapeDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1.0,
                                      style: BorderStyle.solid,
                                      color: Color.fromARGB(255, 37, 37, 37)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(50, 0, 0, 0),
                                child: DropdownButton<String>(
                                  value: selectedValue3,
                                  hint: Text(
                                    'Metodo De Pago',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Theme.of(context).hintColor,
                                    ),
                                  ),
                                  onChanged: (val) =>
                                      setState(() => metodo = val),
                                  items: Metodos.map<DropdownMenuItem<String>>(
                                      (String value) =>
                                          DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          )).toList(),

                                  // add extra sugar..
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconSize: 42,
                                  underline: SizedBox(),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(50, 0, 0, 0),
                              child: DecoratedBox(
                                decoration: ShapeDecoration(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1.0,
                                        style: BorderStyle.solid,
                                        color: Color.fromARGB(255, 37, 37, 37)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      50, 0, 0, 0),
                                  child: DropdownButton<String>(
                                    value: selectedValue4,
                                    hint: Text(
                                      'Tarjeta',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Theme.of(context).hintColor,
                                      ),
                                    ),
                                    onChanged: (val) =>
                                        setState(() => selectedValue4 = val),
                                    items: listarcuentam.values
                                        .map<DropdownMenuItem<String>>(
                                            (String value) =>
                                                DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                ))
                                        .toList(),

                                    // add extra sugar..
                                    icon: Icon(Icons.arrow_drop_down),
                                    iconSize: 42,
                                    underline: SizedBox(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(250, 40, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 269, 0),
                                child: TextFormField(
                                  controller: textController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Numero de cuotas',
                                    hintText: ' 0-48',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF2F3A3C),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF2F3A3C),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(250, 40, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 50, 0),
                              child: Text(
                                'Monto a pagar:',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 50, 0),
                                child: Text(
                                  '30.000',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                  ),
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(250, 10, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(40, 30, 0, 0),
                              child: SizedBox(
                                width: 150,
                                height: 50,
                                child: ElevatedButton(
                                  child: Text(
                                    'Enviar',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 40.0, vertical: 20.0),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.0)),
                                      primary:
                                          Color.fromARGB(255, 64, 76, 251)),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const InicioPageWidget()),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
