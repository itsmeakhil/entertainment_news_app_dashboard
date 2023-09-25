import 'dart:io';
import 'dart:typed_data';

import 'package:entertainment_news_app_dashboard/utils/utils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/colors.dart';
import '../widgets/category_field.dart';
import '../widgets/login_button.dart';
import '../widgets/post_type_field.dart';
import '../widgets/textfield_form.dart';

class AddPostForm extends StatefulWidget {
  const AddPostForm({Key? key}) : super(key: key);

  @override
  State<AddPostForm> createState() => _AddPostFormState();
}

class _AddPostFormState extends State<AddPostForm> {
  PlatformFile? _imageFile;
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
            child: Column(
              children: [
                const Center(
                    child: Text(
                  'Add Post',
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),
                )),
                15.ph,
                const TextFieldForm(hintText: 'Tittle',),
                10.ph,
                const TextFieldForm(hintText: 'Content',maxLine: 8,),
                10.ph,
                 Row(
                  children: [
                    const Expanded(child: CategoryField()),
                    10.pw,
                    const Expanded(child: PostTypeField()),
                    10.pw,
                    Expanded(child: LoginButton(text: _imageFile != null? 'Image Added':  'Add Image', onPressed: _pickImage,))

                  ],
                ),
                10.ph,
                const TextFieldForm(hintText: 'Video url',),
                10.ph,
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
        ));
  }
}
