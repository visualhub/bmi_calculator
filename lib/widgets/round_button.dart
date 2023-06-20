import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56,
        width: 56,
        decoration: BoxDecoration(
          color: const Color(0xFF4C5065).withOpacity(0.8),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 35,
          color: Colors.white,
        ),
      ),
    );
  }
}
