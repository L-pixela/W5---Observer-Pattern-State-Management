import 'package:flutter/material.dart';
import 'package:provider_demo/exercise2/model/card_type.dart';
import 'package:provider_demo/exercise2/screen/tap/color_tap.dart';

class ColorTapsScreen extends StatelessWidget {
  const ColorTapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("is ColorTapsScreen updating ?");
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
