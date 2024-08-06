import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/utilities/constants.dart';
import 'package:flash_chat/utilities/routes.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../utilities/widgets/AuthButton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpiner = false;
  late String email;
  late String password;

  void togleSpiner(bool value) {
    setState(() {
      showSpiner = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpiner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  style: kInputTextStyle,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your email')),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                  onChanged: (value) {
                    password = value;
                  },
                  obscureText: true,
                  textAlign: TextAlign.center,
                  style: kInputTextStyle,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter yor password')),
              const SizedBox(
                height: 24.0,
              ),
              AuthButton(
                buttonText: 'log In',
                onPressed: () async {
                  togleSpiner(true);
                  try {
                    final loginetUser = await _auth.signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );

                    if (loginetUser != null) {
                      togleSpiner(false);
                      Navigator.of(context).pushNamed(RouteId.chat);
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                buttonColor: Colors.lightBlue,
              )
            ],
          ),
        ),
      ),
    );
  }
}
