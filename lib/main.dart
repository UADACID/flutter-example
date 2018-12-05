import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Selamat datang ke Flutter gaes'),
        ),
        body: Center(
          child: Text('Halo Dunia'),
        ),
      ),
    );
  }
}
