import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/exercise2/service/tap_counter_notifier.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TapCounter>(
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
