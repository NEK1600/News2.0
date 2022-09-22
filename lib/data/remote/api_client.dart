import 'dart:developer';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news2_0/data/model/well.dart';
import 'package:path/path.dart';

class ApiClient {


  /*Future<List<NewsTwo>> fetchAlbum() async {
    final client = HttpClient();

      final url = Uri.parse('https://newsapi.org/v2/top-headlines?country=ru&apiKey=ab5ce5ad9f2746dca1124e780e89b096');
      final request = await client.getUrl(url);
      final response = await request.close();
      final jsonStrings = await response.transform(utf8.decoder).toList();
      final jsonString = jsonStrings.join();
      final json = jsonDecode(jsonString) as List<dynamic>;
      final news = json
          .map((e) => NewsTwo.fromJson(e as Map<String, dynamic>))
          .toList();
      return news;

  }*/
  //либобо просто <News>
  Future<List<Well>> getNewsTwo() async{
    var client = http.Client();
    var url = Uri.parse('https://newsapi.org/v2/top-headlines?country=ru&apiKey=ab5ce5ad9f2746dca1124e780e89b096');

    var response = await client.get(url);
    if (response.statusCode == 200) {
      var newsModel= null;
      var responseBody = response.body;
      var jsonMap = json.decode(responseBody);
      //на weelcome и возникает ошибка и отладка ничего не выводит
      newsModel = Well.fromJson(jsonMap);
      return newsModel;
    } else {

      // If the server did not return a 200 OK response,
      // then throw an exception.
      print("ошибка апи ${json.decode(response.body)}");
      throw Exception('Failed to load album');
    }

  }

  Future<Well> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://newsapi.org/v2/top-headlines?country=ru&apiKey=ab5ce5ad9f2746dca1124e780e89b096'));

    if (response.statusCode == 200) {
      var newsModel=null;
      var jsonMap = json.decode(response.body);
      newsModel = Well.fromJson(jsonMap);
      print("успех апи ${newsModel}");
      return newsModel;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      print("ошибка апи ${json.decode(response.body)}");
      throw Exception('Failed to load album');
    }
  }


}























