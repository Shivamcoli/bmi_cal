import 'package:bmi_cal/constants.dart';
import 'package:flutter/material.dart';
import '../components/reusable_card.dart';
import '../components/bottom_button.dart';


class Resultspage extends StatelessWidget {

  Resultspage({required this.interpretation ,required this.bmiResult,required this.resulttext});

  final String bmiResult;
  final String resulttext;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: Color(0xFF0A0E21),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text('Your Result',style: kTitleTextStyle,),
          ),
          ),
          Expanded(
            flex: 5,
              child: reusablecard(colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                       resulttext,style: kResultTextStyle,
                      ),
                      Text(bmiResult, style:  kBMITEXTSTYLE),
                      Text(interpretation,style: kBodyTextStyle,textAlign: TextAlign.center,),
                    ],
                  ),
                  onPress:(){},
              ),
          ),
          BottomButton(buttontitle: 'Re-Calculate', onTap: (){
            Navigator.pop(context);
          })
        ],
      ),
    );
  }
}
