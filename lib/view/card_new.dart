import 'package:flutter/material.dart';



class CardNew extends StatelessWidget {
  final String title;
  CardNew({
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom:10),
        child:Container(
            color: Color(0xFF393939),
            height: 100,
            width: MediaQuery.of(context).size.width,
            child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),
                  ),
                ]
            )
        ),
    );
  }


}