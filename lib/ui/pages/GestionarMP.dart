import 'package:f_template_juego_taller1/ui/pages/CuentasG.dart';
import 'package:f_template_juego_taller1/ui/pages/InicioPage.dart';
import 'package:f_template_juego_taller1/ui/pages/TarjetasG.dart';
import 'package:flutter/material.dart';


class GestionarMPWidget extends StatefulWidget {
  const GestionarMPWidget({Key? key}) : super(key: key);

  @override
  _GestionarMPWidgetState createState() => _GestionarMPWidgetState();
}

class _GestionarMPWidgetState extends State<GestionarMPWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(150, 10, 0, 0),
                           
                                child: Text(
                              'Gestionar Medios de Pagos',
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(80, 0, 0, 0),
                              child: Image.network(
                                'https://w7.pngwing.com/pngs/601/234/png-transparent-payment-visa-paypal-logo-credit-card-credit-card-icon-blue-rectangle-payment.png',
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(60, 0, 0, 0),
                              
                                  child: Text(
                                'Tarjetas Agregadas',
                                style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 20,
                                    ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(60, 0, 0, 0),
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
                                  primary: Color.fromARGB(255, 64, 76, 251)
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const TarjetasGWidget()),
                                );
                              },
                            ),
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Color(0xFF2F3A3C),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 80, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(80, 0, 0, 0),
                              child: Image.network(
                                'https://w7.pngwing.com/pngs/169/504/png-transparent-el-banco-de-la-nacion-argentina-bank-transaction-account-bank-blue-text-logo.png',
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(60, 0, 0, 0),
                             
                                  child: Text(
                                'Cuentas  Agregadas',
                                style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 20,
                                    ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(60, 0, 0, 0),
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
                                  primary: Color.fromARGB(255, 64, 76, 251)
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const CuentasGWidget()),
                                );
                              },
                            ),
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Color(0xFF2F3A3C),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(509, 100, 0, 0),
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
                                  primary: Color.fromARGB(255, 64, 76, 251)
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
