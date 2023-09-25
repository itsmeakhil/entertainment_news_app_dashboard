import 'dart:convert';

import 'package:entertainment_news_app_dashboard/screens/widgets/login_button.dart';
import 'package:entertainment_news_app_dashboard/screens/widgets/textfield_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'admin_dashboard.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // void login(String email , password) async {
  //
  //   try{
  //
  //     Response response = await post(
  //         Uri.parse('https://reqres.in/api/login'),
  //         body: {
  //           'email' : 'eve.holt@reqres.in',
  //           'password' : 'cityslicka'
  //         }
  //     );
  //
  //     if(response.statusCode == 200){
  //
  //       var data = jsonDecode(response.body.toString());
  //       print(data['token']);
  //       print('Login successfully');
  //
  //     }else {
  //       print('failed');
  //     }
  //   }catch(e){
  //     print(e.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/prism.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
                child: Center(
                  child: Container(
                    width: 400,
                    height: 480,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(50),
                    decoration: const BoxDecoration(
                      color: scaffoldBackground,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Admin Login",
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                color: adTextColor),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Hey, Enter your details to get sign in to your account",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 13, color: adTextColor.withOpacity(0.7)),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFieldForm(
                            hintText: "User Name",
                            controller: userController,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFieldForm(
                            hintText: "Password",
                            controller: passwordController,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            width: 500,
                            child: LoginButton(
                              text: 'Login',
                              onPressed: () {
                                // login(userController.text.toString(),passwordController.text.toString());
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AdminDashboard()),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )))
      ],
    );
  }
}
