import 'dart:convert';

import 'package:f_template_juego_taller1/ui/pages/AddTarjeta.dart';
import 'package:f_template_juego_taller1/ui/pages/InicioPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class User {
  final String name;
  final String email;
  User({
    required this.name,
    required this.email,
  });
}

final allUsers = [
  User(name: 'paco', email: 'pacomail'),
  User(name: 'paco2', email: 'paco2mail'),
  User(name: 'paco3', email: 'paco3mail'),
];

class TarjetasGWidget extends StatefulWidget {
  const TarjetasGWidget({Key? key}) : super(key: key);

  @override
  _TarjetasGWidgetState createState() => _TarjetasGWidgetState();
}

class _TarjetasGWidgetState extends State<TarjetasGWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  Future<String> getsesion() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var counter = prefs.getString('usuario') ?? 0;
    String wenas = 'hola';
    return counter as String;
  }

  List<User> users = allUsers;

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
    super.initState();
    buildUserListTittle();
  }

  Widget buildUserListTittle() => (Slidable(
        startActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              icon: Icons.delete,
              onPressed: (context) {},
            )
          ],
        ),
        child: ListTile(
          title: Text(
            'Bancolombia Ahorro a la mano',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Color(0xFF050606),
              fontSize: 25,
            ),
          ),
          subtitle: Text(
            '100251131',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Color(0xFF495B5D),
              fontSize: 20,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFF303030),
            size: 20,
          ),
          tileColor: Color(0xFFD0CEE3),
          dense: false,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ));
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
          height: 696,
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
                                EdgeInsetsDirectional.fromSTEB(150, 50, 0, 0),
                            child: Text(
                              'Tarjetas Agregadas',
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
                        padding: EdgeInsetsDirectional.fromSTEB(50, 20, 50, 0),
                        child: SingleChildScrollView(
                          child:
                              Column(mainAxisSize: MainAxisSize.max, children: [
                            ListView.builder(
                              itemCount: 3,
                              itemBuilder: (BuildContext nuevo, index) {
                                return buildUserListTittle();
                              },
                            )

                            //ListView.builder(
                            //  itemCount: users.length,
                            //  itemBuilder: (context, index) {
                            //    final user = users[index];
                            //    return Slidable(
                            //        child: buildUserListTittle(user));
                            // },
                            //),
                          ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(150, 0, 0, 0),
                              child: Ink(
                                decoration: const ShapeDecoration(
                                  color: Colors.lightBlue,
                                  shape: CircleBorder(),
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    color: Color.fromARGB(255, 84, 81, 91),
                                    size: 30,
                                  ),
                                  color: Colors.white,
                                  onPressed: () async {
                                    //context.pop();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AddtarjetaWidget()),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(300, 0, 0, 0),
                              child: SizedBox(
                                width: 130,
                                height: 40,
                                child: ElevatedButton(
                                  child: Text(
                                    'Cerrar',
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
                                          Color.fromARGB(255, 180, 73, 78)),
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
