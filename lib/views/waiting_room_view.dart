import 'package:flutter/material.dart';

class WaitingRoomView extends StatelessWidget {
  const WaitingRoomView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Waiting Room'),
      ),
      body: const Center(
        child: Text('Waiting Room'),
      ),
    );
  }
}
