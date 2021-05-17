import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:loyalty_hd/const_colors.dart';
import 'package:loyalty_hd/cubit/auth/auth_cubit.dart';
import 'package:loyalty_hd/screen/validation/registration.dart';

import '../../const_name.dart';

class Authorization extends StatefulWidget {
  final String error;

  const Authorization({this.error = ""});

  @override
  _AuthorizationState createState() => _AuthorizationState();
}

class _AuthorizationState extends State<Authorization> {
  TextEditingController _textEditingLoginController = TextEditingController();
  TextEditingController _textEditingPasswordController = TextEditingController();

  @override
  void initState() {
    if (widget.error.isNotEmpty) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        var snackBar = SnackBar(content: Text(widget.error));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
            fillColor: Colors.green,
            child: Text("Войти"),
            onPressed: () {
              CubitProvider.of<AuthCubit>(context)
                  .logIn(_textEditingLoginController.text, _textEditingPasswordController.text);
            }),
        RawMaterialButton(
            child: Text("Зарегистрироваться"),
            fillColor: Colors.blue,
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return CubitProvider.value(value: CubitProvider.of<AuthCubit>(this.context), child: Registration());
                }),
              );
            })
      ],
    );
  }
}
