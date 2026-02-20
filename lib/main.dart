import 'package:flutter/material.dart';

import 'screens/phone_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Phone Number Details',
      theme: ThemeData.dark(),
      home: const PhoneDetailsScreen(),
    );
  }
}
