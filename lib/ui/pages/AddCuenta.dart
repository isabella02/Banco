import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:f_template_juego_taller1/ui/pages/InicioPage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class AddcuentaWidget extends StatefulWidget {
  const AddcuentaWidget({Key? key}) : super(key: key);

  @override
  _AddcuentaWidgetState createState() => _AddcuentaWidgetState();
}

class _AddcuentaWidgetState extends State<AddcuentaWidget> {
  String? dropDownValue;
  TextEditingController name = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController ncuenta = TextEditingController();

  final scaffoldKey = GlobalKey<ScaffoldState>();

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

  Future cuentas() async {
    var url = "http://localhost:8080/eduwallet/tarjetas.php";
    var response = await http.post(Uri.parse(url), body: {
      "username": await getsesion(),
      "ncuenta": ncuenta.text,
      "name": name.text,
      "lastname": lname.text,
      "banco": selectedValue,
      "tiptarjeta": 'debito',
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
    name = TextEditingController();
    lname = TextEditingController();
    ncuenta = TextEditingController();
  }

  @override
  void dispose() {
    name?.dispose();
    lname?.dispose();
    ncuenta?.dispose();
    super.dispose();
  }

  final List<String> Bancos = ['East Bank', 'Wester Bank'];

  String? selectedValue;
  String? banco;
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
                                EdgeInsetsDirectional.fromSTEB(100, 50, 0, 0),
                            child: Text(
                              'Agregar Cuenta Bancaria',
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(50, 0, 0, 0),
                              child: Text(
                                'Datos de la cuenta bancaria',
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    50, 10, 40, 10),
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
                                      Icons.person,
                                      color: Color(0xFF757575),
                                      size: 22,
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
                                    30, 10, 40, 10),
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 40, 50, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    50, 10, 40, 10),
                                child: TextFormField(
                                  controller: ncuenta,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Numero de cuenta',
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(50, 0, 0, 0),
                                child: DropdownButton<String>(
                                  value: selectedValue,
                                  hint: Text(
                                    'Banco',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Theme.of(context).hintColor,
                                    ),
                                  ),
                                  onChanged: (val) =>
                                      setState(() => selectedValue = val),
                                  items: Bancos.map<DropdownMenuItem<String>>(
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
                                    'Agregar',
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
                                    h();
                                    cuentas();
                                    //Navigator.push(
                                    //context,
                                    //MaterialPageRoute(builder: (context) => const InicioPageWidget()),
                                    //);
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
