import 'dart:convert';

import 'package:f_template_juego_taller1/ui/pages/AddTarjeta2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'InicioPage.dart';

class AddtarjetaWidget extends StatefulWidget {
  const AddtarjetaWidget({Key? key}) : super(key: key);

  @override
  _AddtarjetaWidgetState createState() => _AddtarjetaWidgetState();
}

class _AddtarjetaWidgetState extends State<AddtarjetaWidget> {
  TextEditingController cpostal = TextEditingController();
  TextEditingController dir = TextEditingController();
  TextEditingController depto = TextEditingController();
  TextEditingController barrio = TextEditingController();
  TextEditingController muni = TextEditingController();
  TextEditingController doc = TextEditingController();
  TextEditingController ntarjeta = TextEditingController();
  TextEditingController fexp = TextEditingController();
  TextEditingController ccv = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Future habla() async {
    Fluttertoast.showToast(
        msg: "hola",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Future<String> getsesion() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var counter = prefs.getString('usuario') ?? 0;
    String wenas = 'hola';
    return counter as String;
  }

  Future cuentas() async {
    var url = "http://localhost:8080/eduwallet/tarjetascred.php";
    var response = await http.post(Uri.parse(url), body: {
      "username": await getsesion(),
      "cpostal": cpostal.text,
      "dir": dir.text,
      "depto": depto.text,
      "barrio": barrio.text,
      "muni": muni.text,
      "doc": doc.text,
      "ncuenta": ntarjeta.text,
      "fexp": fexp.text,
      "ccv": ccv.text,
      "tipdoc": selectedValue,
      "tiptarjetac": selectedValue2,
      "tiptarjeta": 'credito',
      "banco": 'East Bank',
    });

    var data = json.decode(response.body);
    if (data == "Error") {
      Fluttertoast.showToast(
          msg: "Ya tienes esta tarjeta registrada",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.red,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "Exitoso",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const InicioPageWidget()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    cpostal.dispose();
    dir.dispose();
    cpostal.dispose();
    depto.dispose();
    barrio.dispose();
    muni.dispose();
    doc.dispose();
    ntarjeta.dispose();
    ccv.dispose();
    super.dispose();
  }

  final List<String> Identificaciones = [
    'Cedula de Ciudadania',
    'Cedula Extranjera',
    'Targeta de Identidad'
  ];

  final List<String> TiposTarjetas = ['Visa', 'Mastercard', 'American Express'];

  String? selectedValue;
  String? identificacion;
  String? selectedValue2;
  String? tipotar;
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
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: 9000,
            height: 1692,
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
              children: <Widget>[
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(50, 50, 0, 0),
                  child: Container(
                    width: 800,
                    height: 1000,
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
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
                                  EdgeInsetsDirectional.fromSTEB(160, 20, 0, 0),
                              child: Text(
                                'Agregar Tarjeta',
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(50, 0, 0, 0),
                                child: Text(
                                  'Dirección de cobro',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(0, 10, 400, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      50, 10, 30, 10),
                                  child: TextFormField(
                                    controller: cpostal,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Codigo postal',
                                      hintText: '80020',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF2F3A3C),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF2F3A3C),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      50, 10, 30, 10),
                                  child: TextFormField(
                                    controller: dir,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Dirección',
                                      hintText: 'Escribir aquí',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF2F3A3C),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF2F3A3C),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      suffixIcon: Icon(
                                        Icons.location_on,
                                        color: Color(0xFF757575),
                                        size: 25,
                                      ),
                                    ),
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      50, 10, 30, 10),
                                  child: TextFormField(
                                    controller: barrio,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Barrio',
                                      hintText: 'Escribir aquí',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF2F3A3C),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF2F3A3C),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      50, 10, 30, 10),
                                  child: TextFormField(
                                    controller: depto,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Departamento',
                                      hintText: 'Escribir aquí',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF2F3A3C),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF2F3A3C),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      50, 10, 30, 10),
                                  child: TextFormField(
                                    controller: muni,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Municipio',
                                      hintText: 'Escribir aquí',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF2F3A3C),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF2F3A3C),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 20,
                          thickness: 2,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(50, 0, 0, 0),
                                child: Text(
                                  'Información del titular',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      50, 0, 0, 0),
                                  child: DropdownButton<String>(
                                    value: selectedValue,
                                    hint: Text(
                                      'Tipo de Documento',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Theme.of(context).hintColor,
                                      ),
                                    ),
                                    onChanged: (val) =>
                                        setState(() => selectedValue = val),
                                    items: Identificaciones.map<
                                            DropdownMenuItem<String>>(
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
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      60, 10, 50, 10),
                                  child: TextFormField(
                                    controller: doc,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Numero de identificación',
                                      hintText: 'Escribir aquí',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF2F3A3C),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF2F3A3C),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      suffixIcon: Icon(
                                        Icons.account_box_outlined,
                                        color: Color(0xFF757575),
                                        size: 25,
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(50, 0, 0, 0),
                                child: Text(
                                  'Datos de la tarjeta',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 40, 50, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      50, 10, 40, 10),
                                  child: TextFormField(
                                    controller: ntarjeta,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Numero de tarjeta',
                                      hintText: 'Escribir aquí',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF2F3A3C),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF2F3A3C),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      50, 0, 0, 0),
                                  child: DropdownButton<String>(
                                    value: selectedValue2,
                                    hint: Text(
                                      'Tipo de Tarjeta',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Theme.of(context).hintColor,
                                      ),
                                    ),
                                    onChanged: (val) =>
                                        setState(() => selectedValue2 = val),
                                    items: TiposTarjetas.map<
                                            DropdownMenuItem<String>>(
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      50, 10, 20, 10),
                                  child: TextFormField(
                                    controller: fexp,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Fecha de vencimiento',
                                      hintText: '01/22',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF2F3A3C),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF2F3A3C),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 20,
                                    ),
                                    keyboardType: TextInputType.datetime,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      30, 10, 30, 10),
                                  child: TextFormField(
                                    controller: ccv,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'CVV',
                                      hintText: 'Escribir aquí',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF2F3A3C),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF2F3A3C),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
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
                          padding:
                              EdgeInsetsDirectional.fromSTEB(250, 40, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    40, 10, 0, 0),
                                child: SizedBox(
                                  width: 150,
                                  height: 50,
                                  child: ElevatedButton(
                                    child: Text(
                                      'Agregar',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
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
                                      cuentas();
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
      ),
    );
  }
}
