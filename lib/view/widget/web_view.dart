import 'package:flutter/material.dart';
import 'package:news2_0/data/model/well.dart';
import 'package:url_launcher/url_launcher.dart';



class WebView extends StatelessWidget {
  final Future<Well> futureAlbum;
  WebView({
    required this.futureAlbum,
  });

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF393939),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(0.0),
            topLeft: Radius.circular(0.0),
          ),
        ),
      ),
      child: Text('Читать далее', style: TextStyle(fontSize: 24)),
      onPressed: () => {
        futureAlbum.then((result) =>
            _launchURL(result.articles![arguments['exampleArgument']].url!)
        ),
      },
    );
  }

  _launchURL(String string) async {
    var uri = Uri.parse(string);
    debugPrint("лаунч ${uri}");
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      debugPrint("кнопка есть${string}");
      throw 'Could not launch $uri';
    }
  }


}