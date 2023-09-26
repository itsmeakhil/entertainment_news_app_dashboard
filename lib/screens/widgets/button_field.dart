import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class ButtonField extends StatelessWidget {
  final String text;
  final Function onPressed;
  final IconData iconData;
  final Color color;

  const ButtonField({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.iconData,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        side: MaterialStateProperty.all(
           BorderSide(color: adTextColor.withOpacity(0.2)),
        ),
      ),
      onPressed: () {
        onPressed();
      },
      icon: Icon(iconData,color: adTextColor.withOpacity(0.5),size: 15,),
      label: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Text(
          text,
          style:  TextStyle(color: adTextColor.withOpacity(0.5),fontSize: 12),
        ),
      ),
    );
  }
}
