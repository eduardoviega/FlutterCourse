import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/male_female.dart';
import 'package:bmi_calculator/constants.dart';
import 'results_page.dart';
import 'package:bmi_calculator/components/bottom_button.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int heigth = 180;
  int weigth = 62;
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
                        child: MaleFemale(
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
                        child: MaleFemale(
                            iconML: FontAwesomeIcons.venus, textML: 'FEMALE'),
                      )),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              onPress: () {},
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
                      Text(heigth.toString(), style: kNumberTextStyle),
                      Text('cm', style: kTextStyle)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbColor: Color(0xFFEB1555),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                      value: heigth.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          heigth = newValue.round();
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
                    onPress: () {},
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('WEIGHT', style: kTextStyle),
                        Text(weigth.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() => weigth--);
                              },
                              elevation: 6.0,
                              backgroundColor: const Color(0xFF4C4F5E),
                              shape: const CircleBorder(),
                              child: const Icon(FontAwesomeIcons.minus,
                                  color: Colors.white),
                            ),
                            SizedBox(width: 10.0),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() => weigth++);
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
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
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
                            SizedBox(width: 10.0),
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
              Navigator.pushNamed(context, '/results');
            },
            child: BottomButton(buttonTitle: "CALCULATE"),
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed(),
      elevation: 6.0,
      backgroundColor: const Color(0xFF4C4F5E),
      // constraints: const BoxConstraints.tightFor(
      //   width: 56.0,
      //   height: 56.0,
      // ),
      shape: const CircleBorder(),
      child: Icon(icon, color: Colors.white),
    );
  }
}

// FloatingActionButton(
// onPressed: null,
// child: Icon(Icons.add, color: Colors.white),
// backgroundColor: Color(0xFF3C3F57),
// )
