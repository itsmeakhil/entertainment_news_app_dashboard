import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 40),
        color: adSecondary,
      ),
    );
  }
}
