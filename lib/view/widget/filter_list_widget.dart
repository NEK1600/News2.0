import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news2_0/bloc/login_bloc.dart';
import 'package:news2_0/data/model/well.dart';
import 'package:news2_0/data/remote/api_client.dart';
import 'package:news2_0/data/remote/repository.dart';
import 'package:news2_0/view/widget/card_new.dart';

class FilterListWidget extends StatefulWidget {
  FilterListWidget({
    Key? key,}) : super(key: key);
  @override
  FilterList createState() => FilterList();
}

class FilterList extends State<FilterListWidget> {
  final newsRepository = Repository();
  final String qWord = "";
  final LoginBloc loginBloc = LoginBloc();
  final _wordException = TextEditingController();
  @override
  void initState() {
    loginBloc.add(OutputNewsEvent());
    super.initState();
  }
  @override
  void dispose() {
    _wordException.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);

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
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
                  )),
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: BlocBuilder<LoginBloc, LoginState>(
                                builder: (context, state) {
                                  if(state is NewsInitial){
                                    return Center(child: Text("Нет Данных"),);
                                  }if(state is NewsLoadingInitial){
                                    return  Center(child:CircularProgressIndicator());
                                  }if(state is NewsLoadedInitial){
                                    return TextFormField(
                                      controller: _wordException,
                                      style: TextStyle(color: Colors.white),
                                      decoration: const InputDecoration(
                                        hintStyle: TextStyle(fontSize: 17, color: Color(0xFF7D7D7D)),
                                        filled: true, fillColor: Color(0xFF202020), hintText: 'ключевое слово'),
                                         //onChanged: (_) => BlocProvider.of<LoginBloc>(context).add(SearchNewsEvent(_wordException.text)),
                                        onFieldSubmitted: (price) {
                                          BlocProvider.of<LoginBloc>(context).add(SearchNewsEvent(_wordException.text));
                                          },
                                    );
                                  }if(state is NewsErrorInitial){
                                    return Center(child: Text("ошибка"),);
                                  }
                                  return CircularProgressIndicator();

                              }),

                          ),
                        ])
                  ])),


          Expanded(
            flex: 10,
            child: BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                     if(state is NewsInitial){
                       return Center(child: Text("Нет Данных"),);
                     }if(state is NewsLoadingInitial){
                       return Center(child:CircularProgressIndicator());
                     }if(state is NewsLoadedInitial){
                       return ListView.builder(
                         itemCount: state.well.articles?.length,
                         itemBuilder: (context, index) => GestureDetector(
                           child: CardNew(
                             title: state.well.articles![index].title!,),
                           onTap: () {
                             Navigator.pushNamed(context, '/description',
                                 arguments: {'exampleArgument': index});
                           },),
                       );
                     }if(state is NewsErrorInitial){
                        return Center(child: Text("ошибка"),);
                     }
                     return CircularProgressIndicator();
              }
            ),
          ),
        ]);
  }
}

