import 'package:flash_chat/utilities/routes.dart';
import 'package:flutter/material.dart';

class FlashChat extends StatelessWidget {
  const FlashChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black),
        ),
      ),
      initialRoute: RouteId.welcome,
      routes: pageRoutes,
    );
  }
}
