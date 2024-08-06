import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/utilities/routes.dart';
import 'package:flash_chat/utilities/widgets/AuthButton.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
      body: Padding(
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
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter yor Email')),
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
              buttonText: 'Register',
              onPressed: () async {
                togleSpiner(true);
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                    email: email,
                    password: password,
                  );

                  if (newUser != null) {
                    togleSpiner(false);
                    Navigator.of(context).pushNamed(RouteId.chat);
                  }
                } catch (e) {
                  print(e);
                }
              },
              buttonColor: Colors.blueAccent,
            )
          ],
        ),
      ),
    );
  }
}
