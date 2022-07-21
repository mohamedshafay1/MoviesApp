import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Controller/Provider/GetPopuler.dart';
import 'Controller/Provider/GetTopRated.dart';
import 'View/Screens/HomeScreen/homescreen.dart';

void main() {
  runApp(
      MultiProvider(providers:[
        ChangeNotifierProvider(create:(_)=>GetPopuler()),
        ChangeNotifierProvider(create:(_)=>GetTopRated()),
      ],
      child:const MyApp() ,
      )

      );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const homescreen(),
    );
  }
}

