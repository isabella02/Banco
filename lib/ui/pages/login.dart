import 'dart:convert';

import 'package:f_template_juego_taller1/ui/pages/InicioPage.dart';
import 'package:f_template_juego_taller1/ui/pages/homepage.dart';
import 'package:f_template_juego_taller1/ui/pages/registro.dart';
import 'package:f_template_juego_taller1/ui/pages/registro2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  late bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Future sesion() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('usuario', user.text);
  }

  Future<String> getsesion() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var counter = prefs.getString('usuario') ?? 0;
    String wenas = 'hola';
    return counter as String;
  }

  Future h() async {
    Fluttertoast.showToast(
        msg: await getsesion(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

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

  Future login() async {
    var url = "http://localhost:8080/eduwallet/login.php";
    var response = await http.post(Uri.parse(url), body: {
      "username": user.text,
      "password": pass.text,
    });
    var data = json.decode(response.body);
    if (data == "Success") {
      Fluttertoast.showToast(
          msg: "Login exitoso",
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
    } else {
      Fluttertoast.showToast(
          msg: "No se ha encontrado su usuario y contraseña",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 180, 73, 78),
          textColor: Color.fromARGB(255, 128, 28, 28),
          fontSize: 16.0);
    }
  }

  @override
  void initState() {
    super.initState();
    user = TextEditingController();
    pass = TextEditingController();
    passwordVisibility = false;
  }

  @override
  void dispose() {
    user.dispose();
    pass.dispose();
    super.dispose();
  }

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
                  width: 600,
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
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
                                EdgeInsetsDirectional.fromSTEB(150, 50, 0, 0),
                            child: Text(
                              'Iniciar Sesión',
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    200, 0, 0, 0),
                                child: Text(
                                  'Identificación',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  150, 0, 150, 0),
                              child: TextFormField(
                                controller: user,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: '     numero deindentificación',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF2F3A3C),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF2F3A3C),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF2F3A3C),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF2F3A3C),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    200, 20, 0, 0),
                                child: Text(
                                  'Contraseña',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  150, 0, 150, 0),
                              child: TextFormField(
                                controller: pass,
                                autofocus: true,
                                obscureText: !passwordVisibility,
                                decoration: InputDecoration(
                                  hintText: '     contraseña',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF2F3A3C),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF2F3A3C),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF2F3A3C),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF2F3A3C),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  suffixIcon: InkWell(
                                    onTap: () => setState(
                                      () => passwordVisibility =
                                          !passwordVisibility,
                                    ),
                                    focusNode: FocusNode(skipTraversal: true),
                                    child: Icon(
                                      passwordVisibility
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: Color(0xFF757575),
                                      size: 22,
                                    ),
                                  ),
                                ),
                                keyboardType: TextInputType.visiblePassword,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(220, 20, 0, 0),
                              child: ElevatedButton(
                                child: Text(
                                  'Iniciar Sesion',
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
                                    primary: Color.fromARGB(255, 64, 76, 251)),
                                onPressed: () {
                                  sesion();
                                  sesion();
                                  h();
                                  login();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(220, 20, 0, 0),
                            child: ElevatedButton(
                              child: Text(
                                'Registrarse',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF6E43CB),
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
                                  primary: Color.fromARGB(255, 255, 255, 255)),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Registro2Widget()),
                                );
                              },
                            ),
                          ),
                        ],
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
