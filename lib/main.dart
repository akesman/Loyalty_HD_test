import 'package:flutter/material.dart';
import 'package:loyalty_hd/screen/home.dart';
import 'package:loyalty_hd/services/user_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<UserService>(create: (context) => UserService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home(),
      ),
    ),
  );
}
