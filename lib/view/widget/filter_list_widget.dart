import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news2_0/bloc/login_bloc.dart';
import 'package:news2_0/data/model/well.dart';
import 'package:news2_0/data/remote/api_client.dart';
import 'package:news2_0/data/remote/repository.dart';
import 'package:news2_0/view/widget/card_new.dart';

class FilterListWidget extends StatefulWidget {
  late Future<Well> futureAlbum2;
  final wordException;
  FilterListWidget({
    Key? key,
    required this.futureAlbum2,
    required this.wordException,
  }) : super(key: key);
  @override
  FilterList createState() => FilterList();
}

class FilterList extends State<FilterListWidget> {
  final newsRepository = Repository();
  final String qWord = "";
  @override
  Widget build(BuildContext context) {
    final LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);

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
                                controller: widget.wordException,
                                style: TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                    hintStyle: TextStyle(
                                        fontSize: 17, color: Color(0xFF7D7D7D)),
                                    filled: true,
                                    fillColor: Color(0xFF202020),
                                    hintText: 'ключевое слово'),
                                onChanged: (str) async {
                                  setState(() {
                                    str = widget.wordException.text;
                                    widget.futureAlbum2 = ApiClient().fetchAlbumTwo(str);
                                  });
                                },
                              ),
                            ),
                          ])
                    ])),
            Expanded(
              flex: 10,
              child: FutureBuilder<Well>(
                future: widget.futureAlbum2,
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
                    return Text('${snapshot.error}');
                  }
                  //print("другое");
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ]);
  }
}
