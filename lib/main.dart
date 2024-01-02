import 'package:flutter/material.dart';
import 'package:sentiment_analyzer_from_text/sentilizer_input_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Depressiya analizle',
      theme: ThemeData(useMaterial3: true, primaryColor: Colors.deepPurple),
      home: const SentilizerInputScreen(),
    );
  }
}
