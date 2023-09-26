import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:search_choices/search_choices.dart';

import '../../utils/colors.dart';

class MultipleSearchField extends StatefulWidget {
  const MultipleSearchField({Key? key}) : super(key: key);

  @override
  State<MultipleSearchField> createState() => _MultipleSearchFieldState();
}

class _MultipleSearchFieldState extends State<MultipleSearchField> {

  List<DropdownMenuItem> items = [];
  List<int> selectedItemsMultiDialogSelectAllNoneWoClear = [];

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>.multiSelection(
      items: const ["Tag1", "Tag2", "Tag3", 'Tag4',"Tag1", "Tag2", "Tag3", 'Tag4'],
      popupProps: PopupPropsMultiSelection.menu(
        menuProps: const MenuProps(
          backgroundColor: scaffoldBackground,
          elevation: 5,
        ),
        showSearchBox:true,
        searchFieldProps: const TextFieldProps(decoration: InputDecoration(hintText: 'Search here')),
        showSelectedItems: true,
        disabledItemFn: (String s) => s.startsWith('I'),
      ),
      //dropdownSearchDecoration: InputDecoration(labelText: "Name"),

      onChanged: print,

        dropdownDecoratorProps:  DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            labelText: "Select Tags",labelStyle: TextStyle(color: adTextColor.withOpacity(0.5), fontSize: 15),
            hintText: "Select an Int",

          ),
        ),
    )
    ;
  }
}
