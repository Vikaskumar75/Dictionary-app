import 'package:flutter/material.dart';

class FlashcardView extends StatelessWidget {
  final String text;

  FlashcardView({required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      elevation: 4,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 30,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
