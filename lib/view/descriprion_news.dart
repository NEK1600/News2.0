import 'package:flutter/material.dart';
import 'package:news2_0/data/model/well.dart';
import 'package:news2_0/data/remote/api_client.dart';
import 'package:flutter/foundation.dart';
import 'package:news2_0/view/descript_widget.dart';


class DescNews extends StatefulWidget {
  const DescNews({Key? key}) : super(key: key);

  @override
  DescriptNews createState() => DescriptNews();
}


class DescriptNews extends State<DescNews> {

  late Future<Well> futureAlbum;

  @override
  void initState() {
    futureAlbum = ApiClient().fetchAlbum();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //получение индекса новости
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    arguments['exampleArgument'].toString();
    return Scaffold(
        appBar:PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(
            title: Center(child: Text('Фильтр Слово')),
            backgroundColor: Color(0xFF393939),
          ),) ,
        body:DescriptWidget(futureAlbum:futureAlbum),
    );
    debugPrint('movieTitle:gh');
  }


}