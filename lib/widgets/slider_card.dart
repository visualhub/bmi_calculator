import 'package:flutter/material.dart';

class SliderCard extends StatelessWidget {
  const SliderCard({
    super.key,
    required this.value,
    required this.text,
    required this.min,
    required this.max,
    required this.onChanged,
  });

  final int value;
  final String text;
  final double min;
  final double max;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'cm',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Slider(
            value: value.toDouble(),
            onChanged: onChanged,
            thumbColor: Colors.red,
            activeColor: Colors.white,
            inactiveColor: Colors.white.withOpacity(0.5),
            min: min,
            max: max,
          ),
        ],
      ),
    );
  }
}
