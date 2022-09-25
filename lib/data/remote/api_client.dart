import 'dart:developer';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news2_0/data/model/well.dart';
import 'package:path/path.dart';

class ApiClient {

  Future<Well> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://newsapi.org/v2/top-headlines?country=ru&apiKey=ab5ce5ad9f2746dca1124e780e89b096'));

    if (response.statusCode == 200) {
      var newsModel=null;
      var jsonMap = json.decode(response.body);
      newsModel = Well.fromJson(jsonMap);
      //print("успех апи ${newsModel}");
      return newsModel;
    } else {
      print("ошибка апи ${json.decode(response.body)}");
      throw Exception('Failed to load album');
    }
  }


  Future<Well> fetchAlbumTwo(String qWord) async {
    final urii = Uri.parse(
        'https://newsapi.org/v2/top-headlines?'
    ).replace(queryParameters: {
      'q': qWord,
      'apiKey': "ab5ce5ad9f2746dca1124e780e89b096",
      'country':'ru',
    });
    print("ууухх ${urii}");
    final response = await http.get(urii);

    if (response.statusCode == 200) {
      var newsModel=null;
      var jsonMap = json.decode(response.body);
      newsModel = Well.fromJson(jsonMap);
      print("успех апи2 ${newsModel}");
      return newsModel;
    } else {
      print("ошибка апи2 ${json.decode(response.body)}");
      throw Exception('Failed to load album');
    }
  }


}























