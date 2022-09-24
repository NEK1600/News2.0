import 'package:flutter/material.dart';
import 'package:news2_0/view/home_page.dart';


class PanelOp extends State<HomePage> {
  int _selectedIndex = 0;
  final double _sheetSize = 0.4;
  _onItemTapped(index) {
    setState(() {
      DraggableScrollableActuator.reset(context);
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DraggableScrollableSheet(
        key: UniqueKey(),
        initialChildSize: _sheetSize,
        minChildSize: 0.0,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            color: Colors.blue[100],
            child: ListView.builder(
              controller: scrollController,
              itemCount: 25,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text('Item $index'));
              },
            ),
          );
        },
      ),
    );
  }
}