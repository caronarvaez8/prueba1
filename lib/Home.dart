import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String getAlbum = r""" query getUser($page:Int , $limit:Int){
  albums{
    data{
      user{
        username
        email
      }
      photos(options:{paginate :{page:$page , limit :$limit}}){
        data{
          url
        }
        
      }
    }
    
  }
}""";
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    double widthApp = MediaQuery.of(context).size.width;
    double heightApp = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height,
              child: Stack(children: <Widget>[
                Query(
                  options: QueryOptions(documentNode: gql(getAlbum)),
                  builder: (QueryResult result, {fetchMore, refetch}) {
                    if (result.loading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (result.data == null) {
                      return Center(child: Text('no se encontro la base de datos.'));
                    }
                    return Container(
                        margin: EdgeInsets.only(top: (heightApp * 0.17)),
                        child: _countriesView(result));
                  },
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  width: widthApp * 0.45,
                  height: heightApp * 0.16,
                  child: Text(
                    "CONTACTOS",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 22,
                        color: Colors.black),
                  ),
                ),
                Container(
                  child: BottomNavyBar(
                    selectedIndex: _currentIndex,
                    showElevation: true,
                    containerHeight: 60,
                    iconSize: 30,
                    curve: Curves.easeIn,
                    onItemSelected: (index) =>
                        setState(() => _currentIndex = index),
                    items: <BottomNavyBarItem>[
                      BottomNavyBarItem(
                       icon: Icon(Icons.home_outlined, color: Colors.black),
                        title: Text('Home',style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        )),
                        activeColor: Color(0xFFFEDD7C),
                        textAlign: TextAlign.center,
                      ),
                      BottomNavyBarItem(
                        icon: Icon(Icons.message_rounded, color: Colors.black),
                        title: Text(''),
                        activeColor: Color(0xFFFEDD7C),
                        textAlign: TextAlign.center,
                      ),
                      BottomNavyBarItem(
                        icon: Icon(Icons.favorite_border, color: Colors.black),
                        title: Text(''),
                        activeColor: Color(0xFFFEDD7C),
                        textAlign: TextAlign.center,
                      ),
                      BottomNavyBarItem(
                        icon: Icon(Icons.person_outlined, color: Colors.black),
                        title: Text(''),
                        activeColor: Color(0xFFFEDD7C),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
              ]))),
    );
  }

  ListView _countriesView(QueryResult result) {
    final countryList = result.data["users"]["data"];
    return ListView.builder(
      itemCount: countryList.length,
      itemBuilder: (context, index) {
        return new Card(
            margin: EdgeInsets.only(top: 10, bottom: 10, left: 20,right: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Ink(
                decoration: BoxDecoration(
                    color: Color(0xFFFEDD7C).withOpacity(0.31),
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: ListTile(
                    title: Text(countryList[index]['username'],style: TextStyle(
                        
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        )),
                    subtitle: Text(countryList[index]['email']),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: Color(0xFFFEDD7C),
                      size: 40,
                    ))));
      },
    );
  }
}
