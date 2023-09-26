import 'dart:io';
import 'dart:typed_data';

import 'package:entertainment_news_app_dashboard/utils/utils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;

import '../../utils/colors.dart';
import '../widgets/button_field.dart';
import '../widgets/category_field.dart';
import '../widgets/login_button.dart';
import '../widgets/multiple_search_field.dart';
import '../widgets/post_type_field.dart';
import '../widgets/textfield_form.dart';

class AddPostForm extends StatefulWidget {
  const AddPostForm({Key? key}) : super(key: key);

  @override
  State<AddPostForm> createState() => _AddPostFormState();
}

class _AddPostFormState extends State<AddPostForm> {
  PlatformFile? _imageFile;
  List<PlatformFile>? _multiImageFiles;
  QuillController _controller = QuillController.basic();


  Future<void> _pickImage() async {
    try {
      // Pick an image file using file_picker package
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );

      // If user cancels the picker, do nothing
      if (result == null) return;

      // If user picks an image, update the state with the new image file
      setState(() {
        _imageFile = result.files.first;
      });
    } catch (e) {
      // If there is an error, show a snackbar with the error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }
  Future<void> _pickMultiImages() async {
    try {
      // Pick an image file using file_picker package
      FilePickerResult? result = await FilePicker.platform.pickFiles(
          allowMultiple: true
      );

      // If user cancels the picker, do nothing
      if (result == null) return;

      // If user picks an image, update the state with the new image file
      setState(() {
        _multiImageFiles = result.files.map((path) => path).toList();
      });
    } catch (e) {
      // If there is an error, show a snackbar with the error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(maxWidth: 700),
        decoration: const BoxDecoration(
            color: scaffoldBackground,
            borderRadius: BorderRadius.all(Radius.circular(9))),
        child:  Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 25),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Center(
                      child: Text(
                    'Add Post',
                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),
                  )),
                  25.ph,
                  const TextFieldForm(hintText: 'Tittle',),
                  15.ph,
                  const TextFieldForm(hintText: 'Content',maxLine: 15,),
                  15.ph,
                   Row(
                    children: [
                      const Expanded(child: CategoryField()),
                      10.pw,
                      const Expanded(child: PostTypeField()),
                    ],
                  ),
                  15.ph,
                  Row(
                    children: [
                      Expanded(child: ButtonField(text: _imageFile != null? 'Image Added':  'Add Image', onPressed: _pickImage, iconData: _imageFile != null? Icons.check:Icons.add_circle_outline_outlined, color: scaffoldBackground,)),
                      10.pw,
                      Expanded(child: ButtonField(text: _multiImageFiles != null? 'Multiple Images Added':  'Add Multiple Image', onPressed: _pickMultiImages, iconData: _multiImageFiles != null? Icons.check:Icons.add_circle_outline_outlined, color: scaffoldBackground,)),
                    ],
                  ),

                  15.ph,
                  const MultipleSearchField(),
                  15.ph,
                  //  QuillToolbar.basic(controller: _controller),
                  // 15.ph,
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Container(
                  //     height: 100,
                  //     width: MediaQuery.of(context).size.width,
                  //     decoration: const BoxDecoration(
                  //         boxShadow: [BoxShadow(
                  //             color: Colors.lightBlueAccent,
                  //             offset: Offset(5.0, 5.0)    ,
                  //             blurRadius: 10.0,
                  //             spreadRadius: 2.0
                  //         ),
                  //           BoxShadow(
                  //               color: Colors.white,
                  //               offset: Offset(0.0, 0.0),
                  //               blurRadius: 0.0,
                  //               spreadRadius: 0.0
                  //           )
                  //         ]
                  //     ),
                  //     child:
                  //     QuillEditor.basic(controller: _controller, readOnly: false),),
                  // ),
                  // 15.ph,

                  const TextFieldForm(hintText: 'Video url',),
                  25.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      LoginButton(text: 'Save', onPressed: (){},),
                      15.pw,
                      LoginButton(text: 'Cancel', onPressed: (){
                        Navigator.of(context)
                            .pop(); // To
                      },),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
