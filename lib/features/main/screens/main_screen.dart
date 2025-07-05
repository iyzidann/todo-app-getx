import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../todo/screens/home_screen.dart';
import '../../notes/screens/note_screen.dart';
import '../../settings/screens/settings_screen.dart';
import '../../calculator/screens/calculator_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> pages = [
    HomeScreen(),
    NoteScreen(),
    CalculatorScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.check_circle), label: "Todo"),
          BottomNavigationBarItem(icon: Icon(Icons.note), label: 'notes'.tr),
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'calculator'.tr,),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'settings'.tr),
        ],
      ),
    );
  }
}