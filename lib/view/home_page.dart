import 'package:bmi_calculator/view/result_page.dart';
import 'package:bmi_calculator/widgets/gender_card.dart';

import 'package:flutter/material.dart';

import '../widgets/big_red_button.dart';
import '../widgets/slider_card.dart';
import '../widgets/weight_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _gender = '';
  int _height = 160;
  int _weight = 60;
  int _age = 18;

  void _reset() {
    setState(() {
      _gender = '';
      _height = 160;
      _weight = 60;
      _age = 18;
    });
  }

  void _selectGender(String gender) {
    setState(() {
      _gender = gender;
    });
  }

  double _calculateBmi() => ((_weight / _height) / _height) * 10000;

  @override
  Widget build(BuildContext context) {
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 20,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 160,
                      child: Row(
                        children: [
                          Expanded(
                            child: GenderCard(
                              icon: Icons.male,
                              text: 'MALE',
                              selected: _gender == 'male',
                              onTap: () => _selectGender('male'),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: GenderCard(
                              icon: Icons.female,
                              text: 'FEMALE',
                              selected: _gender == 'female',
                              onTap: () => _selectGender('female'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SliderCard(
                      value: _height,
                      text: 'HEIGHT',
                      min: 60,
                      max: 200,
                      onChanged: (value) {
                        setState(() {
                          _height = value.toInt();
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 180,
                      child: Row(
                        children: [
                          WeightCard(
                            text: 'WEIGHT/kg',
                            value: _weight,
                            onTapDecrement: () {
                              setState(() {
                                if (_weight > 0) {
                                  _weight--;
                                }
                              });
                            },
                            onTapIncrement: () {
                              setState(() {
                                if (_weight > 0) {
                                  _weight++;
                                }
                              });
                            },
                          ),
                          const SizedBox(width: 5),
                          WeightCard(
                            text: 'AGE',
                            value: _age,
                            onTapDecrement: () {
                              setState(() {
                                if (_age > 0) {
                                  _age--;
                                }
                              });
                            },
                            onTapIncrement: () {
                              setState(() {
                                if (_age > 0) {
                                  _age++;
                                }
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          BigRedButton(
            text: 'CALCULATE YOUR BMI',
            onTap: () {
              if (_gender.isNotEmpty) {
                double result = _calculateBmi();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(result: result),
                  ),
                ).then((value) {
                  if (value != null) _reset();
                });
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Select Gender'),
                    padding: EdgeInsets.symmetric(
                      vertical: 26,
                      horizontal: 15,
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
