import 'package:flutter/material.dart';

void main() {
  runApp(const Docdoc());
}

class Docdoc extends StatelessWidget {
  const Docdoc({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Docdoc',
      home: Scaffold(
        body: Center(
          child: Text('Docdoc'),
        ),
      ),
    );
  }
}
