import 'package:flutter/material.dart';
import 'package:home_desing/pages/dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pagina de Inicio',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: Dashboard(),
    );
  }
}
