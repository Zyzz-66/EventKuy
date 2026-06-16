import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';

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
        scaffoldBackgroundColor: const Color(0xFFF8F9FA), // Off-white/abu-abu terang
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1565C0), // Deep Blue
          primary: const Color(0xFF1565C0),
          secondary: const Color(0xFF1A73E8), // Sky/Bright Blue
        ),
        fontFamily: 'Inter', // Default sans-serif, jika belum ada asset font akan otomatis pakai font bawaan yang mirip
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF8F9FA),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black87),
        ),
      ),
      home: const DashboardScreen(),
    );
  }
}
