import 'package:flutter/material.dart';
import 'package:flutter_chat/widgets/login/button.dart';

import 'package:flutter_chat/widgets/login/logo.dart';
import 'package:flutter_chat/widgets/login/input.dart';
import 'package:flutter_chat/widgets/login/labels.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Logo(title: 'Messenger'),
                  _Form(),
                  Labels(
                      route: 'register',
                      hintText: 'Do not have an account?',
                      linkText: 'Sign up'),
                  _Privacy()
                ],
              ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  _Form({Key key}) : super(key: key);

  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  @override
  Widget build(BuildContext context) {
    final emailController = new TextEditingController();
    final passwordController = new TextEditingController();

    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          Input(
            icon: Icons.mail_outline,
            placeholder: 'Email',
            textController: emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          Input(
            icon: Icons.lock_outline,
            placeholder: 'Password',
            textController: passwordController,
            isPassword: true,
          ),
          Button(
              text: 'Sign in',
              onPressed: () {
                print(emailController.text);
                print(passwordController.text);
              })
        ],
      ),
    );
  }
}

class _Privacy extends StatelessWidget {
  const _Privacy({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Privacy Policy and Cookie Policy',
        style: TextStyle(fontWeight: FontWeight.w200));
  }
}
