import 'package:flutter/material.dart';

// const PlaceholderContainer
//
class InputTitle extends StatelessWidget {
  final String text;

  InputTitle({required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: Text(
            text,
            // "Password",
            style: const TextStyle(
              color: Color(0xff6a6677),
            ),
          ),
        ),
      ),
    );
  }
}
