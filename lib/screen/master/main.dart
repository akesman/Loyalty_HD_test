import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:loyalty_hd/cubit/auth/auth_cubit.dart';
import 'package:loyalty_hd/data/model/loyalty_user.dart';
import 'package:loyalty_hd/screen/master/cabinet_screen.dart';
import 'package:loyalty_hd/screen/master/profile_screen.dart';

class Main extends StatefulWidget {
  final LoyaltyUser? currentUser;

  const Main(this.currentUser);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  late int _currentIndex;
  late List<Widget> _pages;

  @override
  void initState() {
    _currentIndex = 0;
    _pages = <Widget>[
      CabinetScreen(),
      Container(),
      ProfileScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              child: Icon(Icons.exit_to_app),
              onTap: () {
                CubitProvider.of<AuthCubit>(context).logOut();
              },
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (index) => _changeTab(index),
          currentIndex: _currentIndex,
          items: [
            _buildBottomNavigationBarItem(Text("Кабинет")),
            _buildBottomNavigationBarItem(Text("QR")),
            _buildBottomNavigationBarItem(Text("Профиль")),
          ],
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
    );
  }

  void _changeTab(int index) {
    setState(() {
      if (index == 1) {
        _buildPopUp();
      } else {
        _currentIndex = index;
      }
    });
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(Widget widget) {
    return BottomNavigationBarItem(
      title: widget,
      icon: Container(),
    );
  }

  void _buildPopUp() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('QR'),
        content: Image.network(
          'https://loyalty.harddays.dev/img/favicons/apple-touch-icon-precomposed.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
