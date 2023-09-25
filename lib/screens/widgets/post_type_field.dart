import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class PostTypeField extends StatefulWidget {
  const PostTypeField({super.key});

  @override
  _PostTypeFieldState createState() => _PostTypeFieldState();
}

class _PostTypeFieldState extends State<PostTypeField> {
  String? selectedType;
  List<String> postType = [
    'type1',
    'type2',
    'type3',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: scaffoldBackground ,
          border: Border.all(color: adTextColor.withOpacity(0.2)),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      height: 40,
      child: DropdownButton<String>(
        dropdownColor: scaffoldBackground,
        value: selectedType,
        isExpanded: true,
        padding:const EdgeInsets.symmetric(horizontal: 10.0),
        icon: const Icon(Icons.keyboard_arrow_down, size: 15,color: adTextColor,),
        elevation: 16,
        underline: Container(
          height: 1,
          color: scaffoldBackground,
        ),
        onChanged: (String? newValue) {
          setState(() {
            selectedType = newValue;
          });
        },
        items: postType.map((String postType) {
          return DropdownMenuItem<String>(
            value: postType,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(postType,style:  TextStyle(color: adTextColor.withOpacity(0.5), fontSize: 15),),
            ),
          );
        }).toList(),
        hint:  Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Post Type', style: TextStyle(color: adTextColor.withOpacity(0.5), fontSize: 15),),
        ),
      ),
    );
  }
}
