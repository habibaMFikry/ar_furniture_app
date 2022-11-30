import 'package:flutter/material.dart';
import 'item_list_screen.dart';

void main() {
  runApp(
    App(),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: itemListScreen());
  }
}
