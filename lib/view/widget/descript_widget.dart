import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news2_0/data/model/well.dart';
import 'package:news2_0/data/remote/api_client.dart';
import 'package:news2_0/view/widget/web_view.dart';

import '../../bloc/login_bloc.dart';



class DescriptWidget extends StatelessWidget {
  final Future<Well> futureAlbum;
  DescriptWidget({
    required this.futureAlbum,
  });

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;

    return BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if(state is NewsInitial){
            print("нет данных");
            return Center(child: Text("Нет Данных"),);
          }if(state is NewsLoadingInitial){
            print("данные загружаются");
            return Center(child:CircularProgressIndicator());
          }if(state is NewsLoadedInitial){
            print("Данные загружены");
            return  Column(
                children:<Widget>[
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xFF393939),
                    margin: EdgeInsets.only(bottom:10),
                    child: Text(state.well.articles![arguments['exampleArgument']].title!
                        ,style: TextStyle(color: Colors.white,fontSize: 25))
                  ),
                  if(state.well.articles![arguments['exampleArgument']].author==null)...[
                    Container(
                        height: 33,
                        width: MediaQuery.of(context).size.width,
                        color: Color(0xFF393939),
                        margin: EdgeInsets.only(bottom:10),
                        child:Text("Автор не указан",style: TextStyle(color: Colors.white,fontSize: 25),)
                    ),
                  ]else...[
                    Container(
                        height: 33,
                        width: MediaQuery.of(context).size.width,
                        color: Color(0xFF393939),
                        margin: EdgeInsets.only(bottom:10),
                        child:Text(state.well.articles![arguments['exampleArgument']].author!,
                          style: TextStyle(color: Colors.white,fontSize: 25),)
                    ),
                  ],
                  if(state.well.articles![arguments['exampleArgument']].description==null)...[
                    Expanded(
                      child: Container(
                          height: 600,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(bottom:10),
                          color: Color(0xFF393939),
                          child:Text("Нети описания",style: TextStyle(color: Colors.white,fontSize: 25))
                      ) ,
                    ),
                  ]else...[
                    Expanded(
                      child: Container(
                          height: 600,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(bottom:10),
                          color: Color(0xFF393939),
                          child:Text(state.well.articles![arguments['exampleArgument']].description!,
                                style:TextStyle(color: Colors.white,fontSize: 25))
                      ) ,
                    ),
                  ],
                  Align(
                      alignment: FractionalOffset.bottomCenter,
                      child:Container(
                        width: double.infinity,
                        height: 50,
                        child: WebView(futureAlbum:state.well.articles![arguments['exampleArgument']].url!.toString()),
                      )
                  ),
                ]);
          }if(state is NewsErrorInitial){
            print("ошибка");
            return Center(child: Text("ошибка"),);
          }
          print("всё норм или другое");
          return CircularProgressIndicator();
        }
        );
  }


}