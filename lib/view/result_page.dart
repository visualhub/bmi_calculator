import 'package:bmi_calculator/widgets/big_red_button.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    super.key,
    required this.result,
  });

  final double result;

  String _calulateBodyStatus() {
    if (result < 18.5) {
      return 'underweight';
    } else if (result <= 24.9) {
      return 'normal';
    } else if (result <= 29.9) {
      return 'overweight';
    } else {
      return 'obese';
    }
  }

  @override
  Widget build(BuildContext context) {
    String bodyStatus = _calulateBodyStatus();
    return Scaffold(
      backgroundColor: const Color(0xFF182747),
      appBar: AppBar(
        backgroundColor: const Color(0xFF182747),
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Your Result',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(32),
                      decoration: BoxDecoration(
                        color: const Color(0xFF4C5065).withOpacity(0.4),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              bodyStatus.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 18),
                            Text(
                              result.toStringAsFixed(2),
                              style: const TextStyle(
                                fontSize: 48,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 32),
                            const Text(
                              'Normal BMI range:',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              '18.5 - 25 kg/m2',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 32),
                            Text(
                              bodyStatus == 'normal'
                                  ? 'You have a normal body weight. Good Job!'
                                  : bodyStatus == 'overweight'
                                      ? 'You are over weight. Eat Less!'
                                      : bodyStatus == 'underweight'
                                          ? 'You are under weight. Eat More!'
                                          : 'Khuda da khof kar!',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          BigRedButton(
            text: 'RE-CALCULATE YOUR BMI',
            onTap: () => Navigator.pop(context, 'reset'),
          ),
        ],
      ),
    );
  }
}
