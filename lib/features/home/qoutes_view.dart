import 'package:flutter/material.dart';

class QoutesView extends StatefulWidget {
  const QoutesView({super.key});

  @override
  State<QoutesView> createState() => _QoutesViewState();
}

class _QoutesViewState extends State<QoutesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child:  Text("Qoutes View")
      ),
    );
  }
}
