import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app_view.dart';

// void main() => runApp(const FlashChat());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FlashChat());
}
