import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/session_practice/provider/count_notifier.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterModel>(
      builder: (BuildContext context, counter, Widget? child) {
        return Column(
          children: [
            Text("Count =  ${counter.count}"),
            ElevatedButton(
              onPressed: () => {counter.increment()},
              child: Text("ADD 1"),
            ),
          ],
        );
      },
    );
  }
}
