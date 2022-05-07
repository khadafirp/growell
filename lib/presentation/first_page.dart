import 'package:flutter/material.dart';

class FirtsPage extends StatefulWidget {
  FirtsPage({Key? key}) : super(key: key);

  @override
  _FirtsPageState createState() => _FirtsPageState();
}

class _FirtsPageState extends State<FirtsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("First Page"),
      ),
    );
  }
}