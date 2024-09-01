import 'package:flutter/material.dart';

class MyHomeView extends StatelessWidget {
  const MyHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Wolves'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset('assets/images/04102021-01_generated.jpg'),
              const Spacer(
                flex: 1,
              ),
              const Text(
                "Let's get started",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Spacer(
                flex: 1,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/players');
                },
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                child: const Icon(
                  Icons.arrow_forward_outlined,
                  size: 32,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ));
  }
}
