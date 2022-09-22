import 'package:flutter/material.dart' ;
import 'package:news2_0/data/model/well.dart';
import 'package:news2_0/view/card_new.dart';


class FruitList extends StatelessWidget {
  final List<Well> items;

  FruitList({ required this .items});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        void getStringList(){
          print("отладка листа ${items[index].articles![index].title!}");
        }
        return CardNew(
          title: items[index].articles![index].title!,
        );
      },
    );
  }

}