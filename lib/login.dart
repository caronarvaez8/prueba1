import 'package:Prueba/Home.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
  
}

class _LoginState extends State<Login> {
 final TextEditingController controllerUser = new TextEditingController();
 final TextEditingController controllerPass = new TextEditingController();
  final String objectId= "";

  final String getUser = """ query getUser{
  users{
    data{
      username
      phone
    }
  }
}""";
 

  @override
  Widget build(BuildContext context) {
final variable={
     "username":controllerUser.text,
     
   };
    
    double widthApp = MediaQuery.of(context).size.width;
    double heightApp = MediaQuery.of(context).size.height;
    return Scaffold(
        body: /*Query(
                  options: QueryOptions(documentNode: gql(getUser),variables:variable),
                  builder: (QueryResult result, {fetchMore, refetch}) {
                    if (result.hasException) {
                      return Text(result.exception.toString());
                    }

                    if (result.loading) {
                      return Center(child: CircularProgressIndicator());
                    }

                    List users = result.data["users"]["data"];

                    return ListView.builder(
                      itemCount: users.length, itemBuilder: (context, index){
                        final user = users[index]["username"];
                        return ListTile(
                          title: Text(user)
                        );
                      },
                    );
                    
                  })*/
        SingleChildScrollView(
      child: Container(
        
          height: MediaQuery.of(context).size.height,
          child: Stack(children: <Widget>[
            Container(
                color: Color(0xFFFEDD7C),
                height: heightApp * 0.6,
                alignment: Alignment.bottomCenter),
            Container(
                margin: EdgeInsets.only(top: heightApp * 0.4),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(130.0))),
                alignment: Alignment.topCenter),
            Container(
                child: Column(children: <Widget>[
              
            ])),
            Container(
              margin: EdgeInsets.only(top: heightApp * 0.05),
              child: Image.asset("assets/Imagenes/download.png"),
              height: 400,
              width: 380,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: Container(
                        margin: EdgeInsets.only(top: (heightApp * 0.48)),
                        width: widthApp * 0.75,
                        child: Column(
                          children: <Widget>[
                            
                            TextFormField(
                              controller: controllerUser,
                              decoration: InputDecoration(
                                labelText: 'Username',
                                prefixIcon: Icon(
                                  Icons.person_outline,
                                  color: Color(0xFFFEDD7C),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: (heightApp * 0.02)),
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    controller: controllerPass,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        labelText: 'Password',
                                        prefixIcon: Icon(
                                          Icons.lock_open,
                                          color: Color(0xFFFEDD7C),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: heightApp * 0.07),
                              child: RaisedButton(
                                padding: const EdgeInsets.only(
                                    top: 15, bottom: 15, left: 85, right: 85),
                                color: Color(0xFFFEDD7C),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home()),
                                  );
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(80.0)),
                                child: Text(
                                  "SIGN IN",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 18,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Center(
                  child: Container(
                   
                    margin: EdgeInsets.only(top: (heightApp * 0.85)),
                    alignment: Alignment.topCenter,
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: widthApp * 0.6,
                          margin: EdgeInsets.only(top: (heightApp * 0.05)),
                          alignment: Alignment.topRight,
                            child: Text(
                              "Don’t have an account?",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "cormorant",
                              ),
                            )),
                        Container(
                             alignment: Alignment.topRight,
                             margin: EdgeInsets.only(top: (heightApp * 0.032)),
                            child: FlatButton(
                              onPressed: () {},
                              child: Text('SIGN UP',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900,
                                      color: Color(0xFFFEDD7C))),
                            ))
                      ],
                    ),
                  ),
                ))
              ],
            ),
          ])),
    ));
  }
}
