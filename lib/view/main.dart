import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news2_0/view/descriprion_news.dart';
import 'home_page.dart';

void main() {
  //runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(initialRoute: '/', routes: {
    '/': (BuildContext context) => HomePage(),
    //'/home': (BuildContext context) => HomePage(),
    '/description': (BuildContext context) => DescNews(),
  }));
}
//test1
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.white,
        ),
        home:HomePage(),
    );
  }
}





