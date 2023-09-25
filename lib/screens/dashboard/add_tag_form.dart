import 'package:entertainment_news_app_dashboard/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../widgets/login_button.dart';
import '../widgets/textfield_form.dart';

class AddTagForm extends StatelessWidget {
  const AddTagForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(maxWidth: 700,maxHeight: 300),
        decoration: const BoxDecoration(
            color: scaffoldBackground,
            borderRadius: BorderRadius.all(Radius.circular(9))),
        child:  Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                const Center(
                    child: Text(
                      'Add Tag',
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),
                    )),
                35.ph,
                const TextFieldForm(hintText: 'Name',),
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
        ));
  }
}
