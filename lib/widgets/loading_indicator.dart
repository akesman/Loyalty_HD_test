import 'package:flutter/material.dart';
import 'package:loyalty_hd/const_colors.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      backgroundColor: loadingColor,
    ));
  }
}
