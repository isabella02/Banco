import 'package:f_template_juego_taller1/ui/pages/InicioPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class RegistroTranWidget extends StatefulWidget {
  const RegistroTranWidget({Key? key}) : super(key: key);

  @override
  _RegistroTranWidgetState createState() => _RegistroTranWidgetState();
}

class _RegistroTranWidgetState extends State<RegistroTranWidget> {
  
  String? dropDownValue1;
  String? dropDownValue2;
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final List<String> Conceptos = [
    'Transaccion 4555576\n12/12/12',
    'Transaccion 4555576\n12/12/12',
    'Transaccion 4555576\n12/12/12',
  ];
  final List<String> Sedes = [
    'Barranquilla',
    'Cartagena',
    'Medellin',
    'Sincelejo',
    'Santa Marta',
  ];
  String? selectedValue;
  String? concepto;
  String? selectedValue2;
  String? sede;
 

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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(150, 50, 0, 0),
                            
                                child: Text(
                              'Registro de Transacciones',
                              style:
                                  TextStyle(
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
                                  EdgeInsetsDirectional.fromSTEB(500, 0, 0, 0),
                              child:SizedBox(
                                width: 130,
                                height: 40,
                              child: ElevatedButton(
                              child: Text('Ver',
                              
                              style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                
                                  style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.0)
                                  ),
                                  primary: Color.fromARGB(255, 73, 84, 180)
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const InicioPageWidget()),
                                );
                              },
                            ),
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(50, 20, 50, 0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Slidable(
                                child:DropdownButton<String>(
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
                                  iconSize: 55,
                                  underline: SizedBox(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(500, 0, 0, 0),
                              child:SizedBox(
                                width: 130,
                                height: 40,
                              child: ElevatedButton(
                              child: Text('Cerrar',
                              
                              style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                
                                  style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.0)
                                  ),
                                  primary: Color.fromARGB(255, 180, 73, 78)
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const InicioPageWidget()),
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
