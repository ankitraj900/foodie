import 'package:flutter/material.dart';

class AppWidget {
  static TextStyle headlineTextFieldStyle() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle simpleTextFieldStyle() {
    return const TextStyle(
      color: Colors.blueGrey,
      fontSize: 20.0,
    );
  }

  static TextStyle boldTextFieldStyle() {
    return const TextStyle(
      color: Colors.blueGrey,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle whiteTextFieldStyle() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    );
  }
}