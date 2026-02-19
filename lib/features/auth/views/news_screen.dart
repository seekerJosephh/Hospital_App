import 'package:flutter/material.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('News Screen'),
        ),
        body: const Center(
          child: Text('Welcome to the News Screen!'),
        ),
      ),
    );
  }
}
