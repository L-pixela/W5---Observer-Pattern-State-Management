import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ColorCounters(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}

class ColorCounters extends ChangeNotifier {
  int _redCount = 0;
  int _blueCount = 0;

  int get redCount => _redCount;
  int get blueCount => _blueCount;

  void incrementRed() {
    _redCount++;
    notifyListeners();
  }

  void incrementBlue() {
    _blueCount++;
    notifyListeners();
  }
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

class ColorTapsScreen extends StatelessWidget {
  const ColorTapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Color Taps')),
      body: Column(
        children: const [
          ColorTap(type: CardType.red),
          ColorTap(type: CardType.blue),
        ],
      ),
    );
  }
}

class ColorTap extends StatelessWidget {
  final CardType type;
  const ColorTap({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final color = type == CardType.red ? Colors.red : Colors.blue;

    return Consumer<ColorCounters>(
      builder: (context, counters, child) {
        final count =
            type == CardType.red ? counters.redCount : counters.blueCount;

        return GestureDetector(
          onTap: () => type == CardType.red
              ? counters.incrementRed()
              : counters.incrementBlue(),
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            height: 100,
            child: Center(
              child: Text(
                'Taps: $count',
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorCounters>(
      builder: (context, counters, child) {
        return Scaffold(
          appBar: AppBar(title: const Text('Statistics')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Red Taps: ${counters.redCount}',
                    style: const TextStyle(fontSize: 24)),
                Text('Blue Taps: ${counters.blueCount}',
                    style: const TextStyle(fontSize: 24)),
              ],
            ),
          ),
        );
      },
    );
  }
}

enum CardType { red, blue }
