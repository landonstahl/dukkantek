import 'package:flutter/material.dart';

void showInSnackBar(BuildContext context, String value) {
  Scaffold.of(context).showSnackBar(
    new SnackBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      content: new Text(value),
    ),
  );
}
