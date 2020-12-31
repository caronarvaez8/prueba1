import 'package:flutter/material.dart';
import 'package:Prueba/login.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:toast/toast.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

PermissionStatus _status;

class _SplashState extends State<Splash> {
  TextEditingController controllerUser = new TextEditingController();
  TextEditingController controllerPass = new TextEditingController();
  void initState() {
    super.initState();
    permisoGPS();
  }

  void permisoGPS() async {
    if (await Permission.location.status.isGranted == false) {
      await Permission.location.request().then((req) {
        print(req.isDenied);

        if (req.isDenied) {
          Toast.show("Error  GPS", context,
              duration: Toast.LENGTH_LONG,
              gravity: Toast.CENTER,
              backgroundColor: Color(0xFF8E7525),
              textColor: Colors.white);
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Login()),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double heightApp = MediaQuery.of(context).size.height;
    double widthApp = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(color: Color(0xFFFEDD7C)),
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                Row(children: <Widget>[
                  Expanded(
                      child: Center(
                    child: Container(
                      margin: EdgeInsets.only(top: (heightApp * 0.1)),
                      child: Text(
                        "USERAPP",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 35,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  )),
                ]),
                Row(children: <Widget>[
                  Expanded(
                      child: Center(
                    child: Container(
                      width: widthApp * 0.9,
                      margin: EdgeInsets.only(top: (heightApp * 0.05)),
                      child: Text(
                        "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  )),
                ]),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.only(top: (heightApp * 0.05)),
                          child: RaisedButton(
                            padding: const EdgeInsets.only(
                                top: 15, bottom: 15, left: 45, right: 45),
                            color: Color(0xff1A1A1A),
                            onPressed: () {
                              permisoGPS();
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80.0)),
                            child: Text(
                              "IR A LOGIN",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Image.asset("assets/Imagenes/download.png"),
                        height: 582,
                        width: 728,
                      ),
                    )
                  ],
                ),
              ]),
            )));
  }
}
