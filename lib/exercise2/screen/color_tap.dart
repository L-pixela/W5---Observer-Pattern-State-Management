import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/exercise2/service/tap_counter_notifier.dart';

import '../model/card_type.dart';

class ColorTap extends StatelessWidget {
  final CardType type;
  const ColorTap({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    print("is ColorTap updating??");
    final color = type == CardType.red ? Colors.red : Colors.blue;

    return Consumer<TapCounter>(
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
