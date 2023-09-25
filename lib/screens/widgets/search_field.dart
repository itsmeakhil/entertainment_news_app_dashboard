import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class SearchTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  const SearchTextField({Key? key,required this.hintText, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:controller ,
      decoration: InputDecoration(
          filled: true,
          fillColor: adSecondary,
        hintText: hintText,
        suffixIcon: const Icon(Icons.search)
      ),


    );
  }
}
