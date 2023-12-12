import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Internal Error'),
      ),
      body: Text(
        'Refresh the page, please!',
        style: const TextStyle(
          color: Colors.red,
          fontSize: 18.0,
        ),
      ),
    );
  }
}
