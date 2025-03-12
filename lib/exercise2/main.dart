import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:provider_demo/exercise2/screen/color_tap_screen.dart';
import 'package:provider_demo/exercise2/screen/statistic_screen.dart';
import 'package:provider_demo/exercise2/service/tap_counter_notifier.dart';

void main() {
  return runApp(
    ChangeNotifierProvider(
      create: (context) => TapCounter(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: Home()),
      ),
    ),
  );
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentIndex == 0
          ? const ColorTapsScreen()
          : const StatisticsScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.tap_and_play),
            label: 'Taps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Statistics',
          ),
        ],
      ),
    );
  }
}
