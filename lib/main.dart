import 'package:flutter/material.dart';
import 'package:Prueba/Splash.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
   final HttpLink httpLink = HttpLink(
    uri: "https://graphqlzero.almansi.me/api",
  );
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<GraphQLClient> client = new ValueNotifier<GraphQLClient>(GraphQLClient(
      link: httpLink,
      cache: InMemoryCache()
    ),
  );
    return GraphQLProvider(
      client: client,
      child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
       // scaffoldBackgroundColor: const Color(0xFFF5D770),
        //brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home:Splash(),
      
    ),
      
    );
  }
}