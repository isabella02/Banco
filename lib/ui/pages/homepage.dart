import 'package:f_template_juego_taller1/ui/pages/login.dart';
import 'package:f_template_juego_taller1/ui/pages/registro.dart';
import 'package:f_template_juego_taller1/ui/pages/registro2.dart';
import 'package:flutter/material.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(80, 0, 0, 0),
                child: Text(
                  'EduWallet',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color.fromARGB(255, 2, 1, 3),
                    fontSize: 40,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 50, 0),
              child: Text(
                'Contactanos',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color(0xFF6E43CB),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 50, 0),
              child: InkWell(
                onTap: () async {
                  //context.pushNamed('login');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginWidget()),
                  );
                },
                child: Text(
                  'Pagos en linea',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xFF6E43CB),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 12, 50, 0),
              child: Text(
                'Sedes',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color(0xFF6E43CB),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 50, 50),
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0)),
                    primary: Color.fromARGB(255, 64, 76, 251)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginWidget()),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 50, 50),
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0)),
                    primary: Color.fromARGB(255, 255, 255, 255)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Registro2Widget()),
                  );
                },
              ),
            ),
          ],
          centerTitle: false,
          toolbarHeight: 100,
          elevation: 2,
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          //padding: EdgeInsets.all(32),

          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 9000,
                height: 692,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/fondo.jpg',
                    ).image,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 722,
                        height: 600,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      200, 100, 0, 0),
                                  child: Text(
                                    'Bienvenid@ al',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF2F3A3C),
                                      fontSize: 50,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      200, 0, 0, 0),
                                  child: Text(
                                    'Sistema de ',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF2F3A3C),
                                      fontSize: 50,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                    child: Text(
                                      'pagos',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF3E58BF),
                                        fontSize: 50,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    )),
                                Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                    child: Text(
                                      'en',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF2F3A3C),
                                        fontSize: 50,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    )),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      200, 0, 0, 0),
                                  child: Text(
                                    'lineas EduWallet',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF2F3A3C),
                                      fontSize: 50,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      300, 40, 0, 0),
                                  child: ElevatedButton(
                                    child: Text('Pagar en linea'),
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
                                                const LoginWidget()),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 800,
                        height: 600,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.network(
                              'https://img.freepik.com/vector-gratis/ilustracion-concepto-cartera_114360-1985.jpg?w=740&t=st=1667316256~exp=1667316856~hmac=b8a90a584cf0c3601c3eed0e0e213d77a32eea92793684b720bf9a4122117cc9',
                              height: 140,
                              width: 140,
                            ).image,
                          ),
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
