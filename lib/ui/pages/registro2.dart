import 'dart:convert';
import 'package:f_template_juego_taller1/ui/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class Registro2Widget extends StatefulWidget {
  const Registro2Widget({Key? key}) : super(key: key);

  @override
  _Registro2WidgetState createState() => _Registro2WidgetState();
}

class _Registro2WidgetState extends State<Registro2Widget> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController pass2 = TextEditingController();

  late bool passwordVisibility1;
  TextEditingController? textController3;

  late bool passwordVisibility2;
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

  Future register() async {
    var url = "http://localhost:8080/eduwallet/register.php";
    var response = await http.post(Uri.parse(url), body: {
      "username": user.text,
      "password": pass.text,
      "mail": mail.text,
      "name": name.text,
      "lastname": lname.text,
      "date": date.text,
      "tdoc": selectedValue,
    });

    var data = json.decode(response.body);
    if (data == "Error") {
      Fluttertoast.showToast(
          msg: "Este usuario ya existe",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.red,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "Registro exitoso",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginWidget()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    user = TextEditingController();
    pass = TextEditingController();
    name = TextEditingController();
    lname = TextEditingController();
    date = TextEditingController();
    mail = TextEditingController();
    passwordVisibility1 = false;
    textController3 = TextEditingController();
    passwordVisibility2 = false;
  }

  @override
  void dispose() {
    user.dispose();
    pass.dispose();
    name.dispose();
    mail.dispose();
    lname.dispose();
    date.dispose();
    pass2.dispose();
    super.dispose();
  }

  final List<String> items = [
    'Cedula De Ciudadania',
    'Cedula Extranjera',
    'Tarjeta De Identidad',
  ];
  String? selectedValue;
  String? tipoDoc;
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
            height: 1092,
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
                  child: SingleChildScrollView(
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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    260, 50, 0, 0),
                                child: Text(
                                  'Crear Cuenta',
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        50, 10, 30, 10),
                                    child: TextFormField(
                                      controller: name,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Nombre',
                                        hintText: 'Escribir aquí',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF2F3A3C),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF2F3A3C),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                                        30, 10, 50, 10),
                                    child: TextFormField(
                                      controller: lname,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Apellidos',
                                        hintText: 'Escribir aquí',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF2F3A3C),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF2F3A3C),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 30, 400, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        50, 10, 30, 10),
                                    child: TextFormField(
                                      controller: date,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Fecha de nacimiento',
                                        hintText: '01/09/2002',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF2F3A3C),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF2F3A3C),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        suffixIcon: Icon(
                                          Icons.date_range,
                                          color: Color(0xFF757575),
                                          size: 22,
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
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(60, 30, 0, 0),
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
                                          color:
                                              Color.fromARGB(255, 37, 37, 37)),
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
                                      items: items
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
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        60, 10, 50, 10),
                                    child: TextFormField(
                                      controller: user,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Numero de identificación',
                                        hintText: 'Escribir aquí',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF2F3A3C),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF2F3A3C),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                          Divider(
                            height: 20,
                            thickness: 2,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        50, 50, 30, 10),
                                    child: TextFormField(
                                      controller: mail,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Email',
                                        hintText: 'Escribir aquí',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF2F3A3C),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF2F3A3C),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        suffixIcon: Icon(
                                          Icons.email_outlined,
                                          color: Color(0xFF757575),
                                          size: 22,
                                        ),
                                      ),
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 20,
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        50, 10, 30, 10),
                                    child: TextFormField(
                                      controller: pass,
                                      obscureText: !passwordVisibility1,
                                      decoration: InputDecoration(
                                        labelText: 'Contraseña',
                                        hintText: 'contraseña',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF2F3A3C),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF2F3A3C),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        suffixIcon: InkWell(
                                          onTap: () => setState(
                                            () => passwordVisibility1 =
                                                !passwordVisibility1,
                                          ),
                                          focusNode:
                                              FocusNode(skipTraversal: true),
                                          child: Icon(
                                            passwordVisibility1
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: Color(0xFF757575),
                                            size: 22,
                                          ),
                                        ),
                                      ),
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 20,
                                      ),
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        50, 10, 30, 10),
                                    child: TextFormField(
                                      controller: pass2,
                                      obscureText: !passwordVisibility2,
                                      decoration: InputDecoration(
                                        labelText: 'Confirmar Contraseña',
                                        hintText: 'contraseña',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF2F3A3C),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF2F3A3C),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        suffixIcon: InkWell(
                                          onTap: () => setState(
                                            () => passwordVisibility2 =
                                                !passwordVisibility2,
                                          ),
                                          focusNode:
                                              FocusNode(skipTraversal: true),
                                          child: Icon(
                                            passwordVisibility2
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: Color(0xFF757575),
                                            size: 22,
                                          ),
                                        ),
                                      ),
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 20,
                                      ),
                                      keyboardType:
                                          TextInputType.visiblePassword,
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
                                      40, 30, 0, 0),
                                  child: SizedBox(
                                    width: 150,
                                    height: 50,
                                    child: ElevatedButton(
                                      child: Text(
                                        'Registrarse',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
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
                                        register();
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
