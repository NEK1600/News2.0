import 'package:flutter/material.dart';
import 'package:news2_0/data/model/well.dart';
import 'package:news2_0/data/remote/api_client.dart';
import 'package:news2_0/view/descriprion_news.dart';
import 'package:news2_0/view/open_panel.dart';
import 'card_new.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Well> futureAlbum;
  final _wordException = TextEditingController();
  final category = TextEditingController();

  @override
  void initState() {
    futureAlbum = ApiClient().fetchAlbum();
    super.initState();
  }

  @override
  void dispose() {
    _wordException.dispose();
    category.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(
            title: Center(child: Text('Фильтр Слово')),
            backgroundColor: Color(0xFF393939),
          ),
        ),
        body: Builder(builder: (BuildContext context) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                    color: Color(0xFF393939),
                    child: ExpansionTile(
                        backgroundColor: Color(0xFF393939),
                        title: const Center(
                            child: Text(
                          "Фильтр слово",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                            Expanded(
                              child: TextField(
                                controller: _wordException,
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(
                                      fontSize: 17, color: Color(0xFF7D7D7D)),
                                  filled: true,
                                  fillColor: Color(0xFF202020),
                                  hintText: 'ключевое слово'
                                ),
                              ),
                            ),
                          ])
                        ])),
                Expanded(
                  flex: 10,
                  child: FutureBuilder<Well>(
                    future: futureAlbum,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data?.articles?.length,
                          itemBuilder: (context, index) => GestureDetector(
                            child: CardNew(
                              title: snapshot.data!.articles![index].title!,
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, '/description',
                                  arguments: {'exampleArgument': index});
                            },
                          ),
                        );
                      } else if (snapshot.hasError) {
                        //print("ошибка ${snapshot.error}");
                        return Text('${snapshot.error}');
                      }
                      //print("другое");
                      return const CircularProgressIndicator();
                    },
                  ),
                ),
              ]);
        }));
  }
}
