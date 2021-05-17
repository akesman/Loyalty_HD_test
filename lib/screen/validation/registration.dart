import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:loyalty_hd/const_colors.dart';
import 'package:loyalty_hd/cubit/auth/auth_cubit.dart';
import 'package:loyalty_hd/data/model/loyalty_user.dart';

import '../../const_name.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController _textEditingLoginController = TextEditingController();
  TextEditingController _textEditingPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(applicationName),
          TextField(
            controller: _textEditingLoginController,
            decoration: InputDecoration(
              hintText: "Введите Логин",
            ),
          ),
          TextField(
            controller: _textEditingPasswordController,
            decoration: InputDecoration(
              hintText: "Введите Пароль",
            ),
          ),
          RawMaterialButton(
            fillColor: Colors.blue,
            child: Text("Зарегистрироваться"),
            onPressed: () async {
              Navigator.pop(context);
              LoyaltyUser loyaltyUser = LoyaltyUser();
              loyaltyUser.login = _textEditingLoginController.text;
              loyaltyUser.password = _textEditingPasswordController.text;

              await CubitProvider.of<AuthCubit>(context).saveUser(loyaltyUser);
            },
          )
        ],
      ),
    );
  }
}
