import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'male_female.dart';
import 'constants.dart';

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
                  child: ReusableCard(
                    onPress: () {
                      selectedGender = Gender.male;
                      // setState(() {
                      //   selectedGender = Gender.male;
                      // });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: MaleFemale(
                      iconML: FontAwesomeIcons.mars,
                      textML: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      selectedGender = Gender.female;
                      // setState(() {
                      //   selectedGender = Gender.female;
                      // });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: MaleFemale(
                      iconML: FontAwesomeIcons.venus,
                      textML: 'FEMALE',
                    ),
                  ),
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
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              // onPressed: () {
                              //   setState(() {
                              //     weigth--;
                              //   });
                              // },
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              // onPressed: () {
                              //   setState(() {
                              //     weigth++;
                              //   });
                              // },
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
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              // onPressed: () {
                              //   setState(() {
                              //     age--;
                              //   });
                              // },
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              // onPressed: () {
                              //   setState(() {
                              //     age++;
                              //   });
                              // },
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
          Container(
            color: kBottomContainerColour,
            margin: const EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomContainerHeight,
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon});
  // RoundIconButton({required this.icon, required this.onPressed});

  final IconData icon;
  // final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      // onPressed: onPressed(),
      elevation: 6.0,
      backgroundColor: const Color(0xFF4C4F5E),
      // constraints: const BoxConstraints.tightFor(
      //   width: 56.0,
      //   height: 56.0,
      // ),
      shape: const CircleBorder(),
      // fillColor: const Color(0xFF4C4F5E),
      child: Icon(icon, color: Colors.white),
    );
  }
}

// FloatingActionButton(
// onPressed: null,
// child: Icon(Icons.add, color: Colors.white),
// backgroundColor: Color(0xFF3C3F57),
// )
