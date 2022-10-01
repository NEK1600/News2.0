import 'package:flutter/material.dart';
import 'package:news2_0/data/model/well.dart';
import 'package:news2_0/data/remote/api_client.dart';
import 'package:news2_0/view/widget/web_view.dart';



class DescriptWidget extends StatelessWidget {
  final Future<Well> futureAlbum;
  DescriptWidget({
    required this.futureAlbum,
  });

  @override
  Widget build(BuildContext context) {

    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    return Column(
      children:<Widget>[
        Container(
            height: 120,
            width: MediaQuery.of(context).size.width,
            color: Color(0xFF393939),
            margin: EdgeInsets.only(bottom:10),
            child:FutureBuilder<Well>(
              future: futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data!.articles![arguments['exampleArgument']].title!,
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),
                  );
                }
                return const CircularProgressIndicator();
              },
            )
        ),
        Container(
            height: 33,
            width: MediaQuery.of(context).size.width,
            color: Color(0xFF393939),
            margin: EdgeInsets.only(bottom:10),
            child:FutureBuilder<Well>(
              future: futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if(snapshot.data!.articles![arguments['exampleArgument']].author==null){
                    debugPrint("успех но");
                    return Text("Источник:",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),);
                  }else{
                    return Text("Источник: ${snapshot.data!.articles![arguments['exampleArgument']].author!}"
                      ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),);
                  }
                }
                return const CircularProgressIndicator();
              },
            )
        ),
        Expanded(
          child: Container(
              height: 600,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(bottom:10),
              color: Color(0xFF393939),
              child:FutureBuilder<Well>(
                future: futureAlbum,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data!.articles![arguments['exampleArgument']].description!
                      ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),);
                  }
                  return const CircularProgressIndicator();
                },
              )
          ) ,
        ),
        Align(
              alignment: FractionalOffset.bottomCenter,
              child:Container(
                width: double.infinity,
                height: 50,
                child: WebView(futureAlbum: futureAlbum,),
              )
          ),


      ],
    );
  }


}