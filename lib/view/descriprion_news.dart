import 'package:flutter/material.dart';
import 'package:news2_0/data/model/well.dart';
import 'package:news2_0/data/remote/api_client.dart';
import 'package:flutter/foundation.dart';


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
        appBar: AppBar(
          title: Center(child:Text('Фильтр Слово')),
          backgroundColor: Color(0xFF393939),
        ),
        body:Column(
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
             Flexible(
               child:
               Container(
                   height: 500,
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
              alignment: Alignment.bottomCenter,
              child:SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF393939)),
                  ),
                  child: Text('Читать далее', style: TextStyle(fontSize: 24)),
                  onPressed: () => {
                    FutureBuilder<Well>(
                      future: futureAlbum,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(snapshot.data!.articles![arguments['exampleArgument']].url!);
                        }
                        return const CircularProgressIndicator();
                      },
                    )
                  },
                ),
              )
            ),

          ],
        ),
    );
    debugPrint('movieTitle:gh');
  }


}