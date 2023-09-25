import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldForm extends StatelessWidget {
  final String hintText;
  final int? maxLine;
  final TextEditingController? controller;
  const TextFieldForm({Key? key,required this.hintText, this.controller,this.maxLine =1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:controller ,
      maxLines: maxLine,
      decoration: InputDecoration(
          hintText: hintText,
      ),

    );
  }
}
