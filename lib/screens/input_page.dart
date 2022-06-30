
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'result_page.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';
import 'package:bmi_cal/calculator_brain.dart';

enum Gender{
  male,
  female,
  none,
}

class InputPage extends StatefulWidget {


  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedgender=Gender.none;
  int height=180;
  int weight=60;
  int age=25;
  Color malecardcolor=kInactivecardcolor;
  Color femalecardcolor=kInactivecardcolor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'BMI CALCULATOR',
        ),
        backgroundColor: Color(0xFF0A0E21),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: reusablecard(
                    onPress: (){
                      setState(() {
                        selectedgender=Gender.male;
                      });
                    },
                    colour:selectedgender==Gender.male?kActiveCardColor:kInactivecardcolor ,
                    cardChild:iconContent(icon: FontAwesomeIcons.mars, label: 'MALE',)
                  ),
                ),
                Expanded(
                  child: reusablecard(
                      onPress: (){
                        setState(() {
                          selectedgender=Gender.female;
                        });
                      },
                    colour:selectedgender==Gender.female?kActiveCardColor:kInactivecardcolor,
                      cardChild:iconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE',)
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: reusablecard(
              onPress: (){},
              colour:kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text('HEIGHT',style: kLabelTextstyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(),
                      style: kNumberText,
                      ),
                      Text('cm',style: kLabelTextstyle,)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.grey,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x25EB1555),
                      thumbShape:
                      RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                      RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      onChanged: (well){
                        setState(() {
                          height=well.toInt();
                        });
                      },
                      value: height.toDouble(),
                      min:120,
                      max:220,

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
                child: reusablecard(
                  onPress: (){},
                  colour:kActiveCardColor ,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: kLabelTextstyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberText,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         RoundIconButton(
                           icon: FontAwesomeIcons.plus,
                           onPressed: (){
                             setState(() {
                              weight++;
                             });
                           },
                         ),
                          SizedBox(width: 10,),
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: reusablecard(
                  onPress: (){},
                  colour:kActiveCardColor ,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: kLabelTextstyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberText,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                age++;
                              });
                            },
                          ),
                          SizedBox(width: 10,),
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                age--;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
          BottomButton(buttontitle: 'CALCULATE', onTap: (){
            CalculatorBrain calc=CalculatorBrain(height: height, weight: weight);
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>Resultspage(
              bmiResult: calc.CalculateBMI(),
                  resulttext:calc.GetResult() ,
                  interpretation:calc.GetInterpretation() ,
            )));
          },),
        ],
      ),
    );
  }
}




