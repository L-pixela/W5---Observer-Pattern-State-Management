import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'session_practice/provider/count_notifier.dart';
import 'session_practice/screen/home.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: MyWidget()),
      ),
    ),
  );
}
