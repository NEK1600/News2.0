import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news2_0/data/model/well.dart';
import 'package:news2_0/data/remote/api_client.dart';
import 'package:news2_0/view/page/descriprion_news.dart';
import 'package:news2_0/view/widget/filter_list_widget.dart';
import '../../bloc/login_bloc.dart';
import '../widget/card_new.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Well> futureAlbum2;

  @override
  void initState() {
    futureAlbum2 = ApiClient().fetchAlbumTwo("");
    super.initState();
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
          return BlocProvider<LoginBloc>(
            //create: (context) => LoginBloc(newsRepository, qWord),
              create: (context) => LoginBloc()
                ..add(OutputNewsEvent()),
              child: FilterListWidget(
                      futureAlbum2: futureAlbum2,
                    )
            );
          }
        )
      );
  }
}
