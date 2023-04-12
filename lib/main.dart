import 'package:flutter/material.dart';
import 'app/app.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async  {
  // Инициализация базы данных Firebase
  WidgetsFlutterBinding.ensureInitialized();
  // Инициализация приложения
  await Firebase.initializeApp();
  runApp(MyApp());
}