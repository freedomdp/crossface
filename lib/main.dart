import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';
import 'firebase_options.dart';

void main() async {
  // Инициализация базы данных Firebase
  WidgetsFlutterBinding.ensureInitialized();
  // Инициализация приложения
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}
