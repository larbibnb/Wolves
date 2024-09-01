import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, required this.buttonTitle});
  final Function()? onPressed;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ElevatedButton(
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              buttonTitle,
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
          )),
    );
  }
}
