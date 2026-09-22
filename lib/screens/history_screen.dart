import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat History'),
      ),
      body: const Center(
        child: Text(
          'No chat history yet.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
