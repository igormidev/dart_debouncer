import 'package:dart_debouncer/dart_debouncer.dart';
import 'package:flutter/material.dart';

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  final Debouncer debouncer = Debouncer(
    timerDuration: const Duration(seconds: 1),
  );
  final emailEC = TextEditingController();

  String typedText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ppBar: AppBar(
        title: Text(typedText),
      ),
      body: Center(
        child: TextField(
          controller: emailEC,
          onChanged: (value) {
            debouncer.resetDebounce(() {
              /// Will only set value after 1 second of no typing
              typedText = value;
            });
          },
        ),
      ),
    );
  }
}
