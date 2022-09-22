import 'package:flutter/material.dart';
import 'package:news2_0/data/model/well.dart';
import 'package:news2_0/data/remote/api_client.dart';
import 'package:news2_0/view/list_news.dart';
import 'card_new.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Well> titleNewsList=[];
  late Future<Well> futureAlbum;


  void getStringList() async {
    var tempList = await ApiClient().fetchAlbum();
    //titleNewsList = tempList;

  }

  @override
  void initState() {
    futureAlbum = ApiClient().fetchAlbum();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Registration')),
      body:FutureBuilder<Well>(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.articles?.length,
              itemBuilder: (context,index)=>CardNew(
                title: snapshot.data!.articles![index].title!,
              ),
            );
            print("успех ${snapshot.data!.articles![0].title.toString()}");
            //return Text(snapshot.data!.articles![0].title.toString());
          } else if (snapshot.hasError) {
            print("ошибка ${snapshot.error}");
            return Text('${snapshot.error}');
          }
          print("другое");
          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      )

    );
  }

}


































