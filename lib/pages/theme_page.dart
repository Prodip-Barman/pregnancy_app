import 'package:flutter/material.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Theme Page'),
      centerTitle: true,
      backgroundColor: Colors.red,
    ),
  );
}