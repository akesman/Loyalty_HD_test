import 'package:flutter/material.dart';
import 'package:loyalty_hd/const_name.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(child: Text("О ПЛ")),
          SizedBox(height: 16),
          Center(child: Text("Название ПЛ")),
          SizedBox(height: 16),
          Center(child: Text("Описание уровней ПЛ")),
          SizedBox(height: 16),
          Center(child: Text("Описание уровня")),
          Center(child: Text("Описание уровня")),
          Center(child: Text("Описание уровня")),
          Center(child: Text("Описание уровня")),
          Center(child: Text("Описание уровня")),
        ],
      ),
    );
  }
}
