import 'package:flutter/material.dart';

import 'Screen/complex_model.dart';
import 'Screen/usermodel.dart';
import 'Screen/usermodel_without_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ComplexApiModel(),
    );
  }
}
