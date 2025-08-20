import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart'; 

import '../../todo/screens/todo_screen.dart'; 
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
    HomeScreen(), // Seharusnya TodoScreen jika mengikuti label
    NoteScreen(),
    CalculatorScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // Mengambil warna dari AppTheme yang sudah Anda definisikan
    final theme = Theme.of(context);

    return Scaffold(
      body: pages[currentIndex],
      // 2. Ganti BottomNavigationBar dengan Container berisi GNav
      bottomNavigationBar: Container(
        // Memberi warna latar belakang dari tema
        color: theme.bottomNavigationBarTheme.backgroundColor,
        child: Padding(
          // 3. Padding untuk membuat efek floating
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
          child: GNav(
            // 4. Konfigurasi GNav
            backgroundColor: theme.bottomNavigationBarTheme.backgroundColor!,
            // Warna tab dari tema
            color: theme.bottomNavigationBarTheme.unselectedItemColor,
            activeColor: theme.bottomNavigationBarTheme.selectedItemColor,
            // Warna background 'pill' untuk item yang aktif
            tabBackgroundColor: theme.brightness == Brightness.dark
                ? Colors.grey.shade800
                : Colors.grey.shade200,
            padding: const EdgeInsets.all(16),
            gap: 8, // Jarak antara ikon dan teks
            selectedIndex: currentIndex,
            onTabChange: (index) => setState(() => currentIndex = index),
            // 5. Animasi saat perpindahan tab
            duration: const Duration(milliseconds: 400),
            tabs: [
              GButton(icon: Icons.check_circle_outline, text: "Todo"),
              GButton(icon: Icons.note_outlined, text: 'notes'.tr),
              GButton(icon: Icons.calculate_outlined, text: 'calculator'.tr),
              GButton(icon: Icons.settings_outlined, text: 'settings'.tr),
            ],
          ),
        ),
      ),
    );
  }
}