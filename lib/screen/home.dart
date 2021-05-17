import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:loyalty_hd/cubit/auth/auth_cubit.dart';
import 'package:loyalty_hd/screen/master/main.dart';
import 'package:loyalty_hd/screen/validation/authorization.dart';
import 'package:loyalty_hd/widgets/loading_indicator.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: CubitProvider(
        create: (context) => AuthCubit(context),
        child: CubitBuilder<AuthCubit, AuthState>(builder: (context, state) {
          if (state is InitialUserState) {
            return Authorization(
              error: state.error,
            );
          } else if (state is UserLoadedState) {
            return Main(state.currentUser);
          }
          return LoadingIndicator();
        }),
      ),
    );
  }
}
