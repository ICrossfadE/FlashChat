import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/utilities/routes.dart';
import 'package:flash_chat/utilities/widgets/AuthButton.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
      // upperBound: 60,
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.bounceOut);

    controller.forward();

    animation =
        ColorTween(begin: Colors.cyan, end: Colors.blue).animate(controller);

    controller.addListener(() {
      setState(() {
        controller.value;
      });
    });
  }

  void despose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 60,
                    child: Image.asset(
                      'images/logo.png',
                    ),
                  ),
                ),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w900,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText('Flash chat',
                          speed: const Duration(milliseconds: 50)),
                    ],
                    totalRepeatCount: 100,
                    pause: const Duration(milliseconds: 5000),
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            AuthButton(
              buttonText: 'Log In',
              onPressed: () {
                Navigator.of(context).pushNamed(RouteId.login);
              },
              buttonColor: Colors.lightBlue,
            ),
            AuthButton(
              buttonText: 'Sing Up',
              onPressed: () {
                Navigator.of(context).pushNamed(RouteId.regestration);
              },
              buttonColor: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
