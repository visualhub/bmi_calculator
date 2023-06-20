import 'package:bmi_calculator/widgets/round_button.dart';
import 'package:flutter/material.dart';

class WeightCard extends StatelessWidget {
  const WeightCard({
    super.key,
    required this.text,
    required this.value,
    required this.onTapDecrement,
    required this.onTapIncrement,
  });

  final String text;
  final int value;
  final VoidCallback onTapIncrement;
  final VoidCallback onTapDecrement;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF4C5065).withOpacity(0.4),
          borderRadius: const BorderRadius.all(
            Radius.circular(6.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              value.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundButton(
                  icon: Icons.remove,
                  onTap: onTapDecrement,
                ),
                const SizedBox(
                  width: 10,
                ),
                RoundButton(
                  icon: Icons.add,
                  onTap: onTapIncrement,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
