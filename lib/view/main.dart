import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news2_0/data/remote/repository.dart';
import 'package:news2_0/view/page/descriprion_news.dart';
import 'page/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        home:RepositoryProvider(
          create: (context) => Repository(),
          child: HomePage(),
        )
    );
  }
}





