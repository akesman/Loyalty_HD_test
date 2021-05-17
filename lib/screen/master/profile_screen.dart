import 'package:flutter/material.dart';
import 'package:loyalty_hd/screen/master/info_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8),
        Center(child: Text("Профиль")),
        SizedBox(height: 8),
        Center(child: Text("Имя пользователя")),
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
        SizedBox(height: 16),
        Center(child: Text("Логин")),
        SizedBox(height: 8),
        Center(child: Text("Дата рождения")),
        SizedBox(height: 8),
        Center(child: Text("Номер карты лояльности")),
        SizedBox(height: 8),
        Center(child: Text("Номер телефона")),
        SizedBox(height: 8),
        Center(child: Text("Описание уровня")),
        SizedBox(height: 8),
      ],
    );
  }
}
