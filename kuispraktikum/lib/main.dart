import 'package:flutter/material.dart';
import 'package:kuispraktikum/list_buku.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Library',
      debugShowCheckedModeBanner: false,
      home: ListBuku(),
    );
  }
}
