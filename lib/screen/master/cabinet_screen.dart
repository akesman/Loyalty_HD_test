import 'package:flutter/material.dart';
import 'package:loyalty_hd/screen/master/info_screen.dart';

class CabinetScreen extends StatefulWidget {
  @override
  _CabinetScreenState createState() => _CabinetScreenState();
}

class _CabinetScreenState extends State<CabinetScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8),
        Center(child: Text("Кабинет")),
        SizedBox(height: 8),
        Center(
          child: GestureDetector(
            child: Text("Название ПЛ"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return InfoScreen();
              }));
            },
          ),
        ),
        SizedBox(height: 8),
        Center(child: Text("Активные бонусы")),
        SizedBox(height: 8),
        Center(child: Text("Таблица покупок")),
        SizedBox(height: 8),
        Expanded(
          child: ListView.builder(itemBuilder: (ctx, index) {
            return Center(child: Text("Покупка $index"));
          }),
        ),
      ],
    );
  }
}
