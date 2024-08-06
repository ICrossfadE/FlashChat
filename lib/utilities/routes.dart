import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';

import '../screens/welcome_screen.dart';

class RouteId {
  static const welcome = '/';
  static const chat = '/chat';
  static const login = '/login';
  static const regestration = '/regestration';
}

Map<String, Widget Function(BuildContext)> pageRoutes = {
  RouteId.welcome: (context) => const WelcomeScreen(),
  RouteId.chat: (context) => const ChatScreen(),
  RouteId.login: (context) => const LoginScreen(),
  RouteId.regestration: (context) => const RegistrationScreen(),
};
