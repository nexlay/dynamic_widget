import 'package:dynamic_widget/screen/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DynamicWidgetApp());
}

class DynamicWidgetApp extends StatelessWidget {
  const DynamicWidgetApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
