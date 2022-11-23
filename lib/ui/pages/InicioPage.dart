import 'package:f_template_juego_taller1/ui/pages/AddCuenta.dart';
import 'package:f_template_juego_taller1/ui/pages/AddTarjeta.dart';
import 'package:f_template_juego_taller1/ui/pages/GestionarMP.dart';
import 'package:f_template_juego_taller1/ui/pages/RPagos.dart';
import 'package:f_template_juego_taller1/ui/pages/RegistroTran.dart';
import 'package:f_template_juego_taller1/ui/pages/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';

class InicioPageWidget extends StatefulWidget {
  const InicioPageWidget({Key? key}) : super(key: key);

  @override
  _InicioPageWidgetState createState() => _InicioPageWidgetState();
}

class _InicioPageWidgetState extends State<InicioPageWidget> {
  PageController? pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Future cleansesion() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('usuario', '');
  }

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
                padding: EdgeInsetsDirectional.fromSTEB(30, 0, 13, 20),
                child: Text(
                  'EduWallet',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 40,
                    color: Color.fromARGB(255, 0, 0, 0),
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
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 50, 0),
              child: Text(
                'Pagos en linea',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color(0xFF6E43CB),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 20, 100, 0),
              child: Text(
                'Sedes',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color(0xFF6E43CB),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 50, 30),
              child: ElevatedButton(
                child: Text(
                  'Cerrar Sesion',
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
                  cleansesion();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomePageWidget()),
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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 8000,
              height: 686,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.network(
                    'https://w0.peakpx.com/wallpaper/899/2/HD-wallpaper-light-blue-to-purple-gradient.jpg',
                  ).image,
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 60),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 800,
                      height: 700,
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
                                    200, 50, 0, 0),
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
                                    350, 40, 0, 0),
                                child: ElevatedButton(
                                  child: Text('Realizar Pago'),
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
                                              const RPagosWidget()),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 40, 0, 0),
                                    child: Text(
                                      'Contactanos en:',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 20,
                                      ),
                                    )),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: Text(
                                    'Instagram: @eduwallet',
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 40, 0, 0),
                                    child: Text(
                                      'Gmai:  eduwallet@gmail.com',
                                    )),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: Icon(
                                    Icons.people,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      //de la iamgen - externa
                      width: 735,
                      height: 700,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.network(
                            '',
                          ).image,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 400,
                                  height: 400,
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 50),
                                        child: PageView(
                                          controller: pageViewController ??=
                                              PageController(initialPage: 0),
                                          scrollDirection: Axis.horizontal,
                                          children: [
                                            Image.network(
                                              'https://lazosdelagente.com/wp-content/uploads/2022/05/Haz-tus-pagos-en-li%CC%81nea-de-una-forma-fa%CC%81cil-ra%CC%81pida-y-segura-con-estos-consejos.png',
                                              width: 50,
                                              height: 50,
                                              fit: BoxFit.cover,
                                            ),
                                            Image.network(
                                              'https://picsum.photos/seed/181/600',
                                              width: 50,
                                              height: 50,
                                              fit: BoxFit.cover,
                                            ),
                                            Image.network(
                                              'https://payretailers.com/wp-content/uploads/2021/03/Todas-las-opciones-a-tu-alcance-para-recibir-pagos-online-1.jpg',
                                              width: 50,
                                              height: 50,
                                              fit: BoxFit.cover,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(0, 1),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 10),
                                          child: smooth_page_indicator
                                              .SmoothPageIndicator(
                                            controller: pageViewController ??=
                                                PageController(initialPage: 0),
                                            count: 3,
                                            axisDirection: Axis.horizontal,
                                            onDotClicked: (i) {
                                              pageViewController!.animateToPage(
                                                i,
                                                duration:
                                                    Duration(milliseconds: 500),
                                                curve: Curves.ease,
                                              );
                                            },
                                            effect: smooth_page_indicator
                                                .ExpandingDotsEffect(
                                              expansionFactor: 2,
                                              spacing: 8,
                                              radius: 16,
                                              dotWidth: 16,
                                              dotHeight: 16,
                                              dotColor: Color(0xFF9E9E9E),
                                              activeDotColor: Color(0xFF3F51B5),
                                              paintStyle: PaintingStyle.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 90, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 3),
                                        child: Text(
                                          'Agregar Tarjeta',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 0),
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                            color: Colors.lightBlue,
                                            shape: CircleBorder(),
                                          ),
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.credit_card_rounded,
                                              color: Color.fromARGB(
                                                  255, 84, 81, 91),
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
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      30, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 3),
                                        child: Text(
                                          'Agregar Cuenta',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 0),
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                            color: Colors.lightBlue,
                                            shape: CircleBorder(),
                                          ),
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.account_balance,
                                              color: Color.fromARGB(
                                                  255, 84, 81, 91),
                                              size: 30,
                                            ),
                                            color: Colors.white,
                                            onPressed: () async {
                                              //context.pop();
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const AddcuentaWidget()),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      50, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 3),
                                          child: Text(
                                            'Gestionar Tarjetas\n       y cuentas',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 16,
                                            ),
                                          )),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 0),
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                            color: Colors.lightBlue,
                                            shape: CircleBorder(),
                                          ),
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.credit_card_rounded,
                                              color: Color.fromARGB(
                                                  255, 84, 81, 91),
                                              size: 30,
                                            ),
                                            color: Colors.white,
                                            onPressed: () async {
                                              //context.pop();
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const GestionarMPWidget()),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      30, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 3),
                                          child: Text(
                                            ' Registros de\nTransacciones',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 16,
                                            ),
                                          )),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 0),
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                            color: Colors.lightBlue,
                                            shape: CircleBorder(),
                                          ),
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.receipt_long_rounded,
                                              color: Color.fromARGB(
                                                  255, 84, 81, 91),
                                              size: 30,
                                            ),
                                            color: Colors.white,
                                            onPressed: () async {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const RegistroTranWidget()),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      50, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 3),
                                        child: Text(
                                          'Realizar Pago',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 0),
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                            color: Colors.lightBlue,
                                            shape: CircleBorder(),
                                          ),
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.monetization_on_sharp,
                                              color: Color.fromARGB(
                                                  255, 84, 81, 91),
                                              size: 30,
                                            ),
                                            color: Colors.white,
                                            onPressed: () async {
                                              //context.pop();
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const RPagosWidget()),
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
    );
  }
}
