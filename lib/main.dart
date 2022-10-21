import 'package:flutter/material.dart';
import 'package:tugas3pbm/homepage.dart';
  
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryIconTheme: IconThemeData(color: Color.fromARGB(115, 247, 130, 214)),
        ),
    );
  }
}