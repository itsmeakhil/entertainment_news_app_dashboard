import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class CategoryField extends StatefulWidget {
  const CategoryField({super.key});

  @override
  _CategoryFieldState createState() => _CategoryFieldState();
}

class _CategoryFieldState extends State<CategoryField> {
  String? selectedCategory;
  List<String> category = [
    'category1',
    'category2',
    'category3',
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
        value: selectedCategory,
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
            selectedCategory = newValue;
          });
        },
        items: category.map((String category) {
          return DropdownMenuItem<String>(
            value: category,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(category,style:  TextStyle(color: adTextColor.withOpacity(0.5), fontSize: 15),),
            ),
          );
        }).toList(),
        hint:  Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Category', style: TextStyle(color: adTextColor.withOpacity(0.5), fontSize: 15),),
        ),
      ),
    );
  }
}
