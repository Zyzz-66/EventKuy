import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const EventApp());
}

class EventApp extends StatelessWidget {
  const EventApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Event & Seminar Indonesia',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor:
            const Color(0xFFF8FAFC), // Abu-abu sangat terang (Slate 50)
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          primary: Colors.indigo,
          secondary: Colors.amber,
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
