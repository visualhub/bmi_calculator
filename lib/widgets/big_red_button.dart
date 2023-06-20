import 'package:flutter/material.dart';

class BigRedButton extends StatelessWidget {
  const BigRedButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith(
            (states) => const Color(0xFFFD0225),
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
