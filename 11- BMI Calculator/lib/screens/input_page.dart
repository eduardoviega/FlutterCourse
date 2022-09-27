import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/male_female.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'results_page.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 62;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                      onTap: () {
                        setState(() => selectedGender = Gender.male);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: selectedGender == Gender.male
                              ? kActiveCardColor
                              : kInactiveCardColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const MaleFemale(
                            iconML: FontAwesomeIcons.mars, textML: 'MALE'),
                      )),
                ),
                Expanded(
                  child: GestureDetector(
                      onTap: () {
                        setState(() => selectedGender = Gender.female);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: selectedGender == Gender.female
                              ? kActiveCardColor
                              : kInactiveCardColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const MaleFemale(
                            iconML: FontAwesomeIcons.venus, textML: 'FEMALE'),
                      )),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kNumberTextStyle),
                      Text('cm', style: kTextStyle)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbColor: const Color(0xFFEB1555),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: const Color(0xFF8D8E98),
                        overlayColor: const Color(0x29EB1555),
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15.0),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('WEIGHT', style: kTextStyle),
                        Text(weight.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() => weight--);
                              },
                              elevation: 6.0,
                              backgroundColor: const Color(0xFF4C4F5E),
                              shape: const CircleBorder(),
                              child: const Icon(FontAwesomeIcons.minus,
                                  color: Colors.white),
                            ),
                            const SizedBox(width: 10.0),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() => weight++);
                              },
                              elevation: 6.0,
                              backgroundColor: const Color(0xFF4C4F5E),
                              shape: const CircleBorder(),
                              child: const Icon(FontAwesomeIcons.plus,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('AGE', style: kTextStyle),
                        Text(age.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() => age--);
                              },
                              elevation: 6.0,
                              backgroundColor: const Color(0xFF4C4F5E),
                              shape: const CircleBorder(),
                              child: const Icon(FontAwesomeIcons.minus,
                                  color: Colors.white),
                            ),
                            const SizedBox(width: 10.0),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() => age++);
                              },
                              elevation: 6.0,
                              backgroundColor: const Color(0xFF4C4F5E),
                              shape: const CircleBorder(),
                              child: const Icon(FontAwesomeIcons.plus,
                                  color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            child: const BottomButton(buttonTitle: "CALCULATE"),
          ),
        ],
      ),
    );
  }
}
