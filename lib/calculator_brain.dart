
import 'dart:math';
class CalculatorBrain{
  CalculatorBrain({required this.height,required this.weight});
  final int height;
  final int weight;
  late double _bmi;
  String CalculateBMI(){
    _bmi=weight/pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }

  String GetResult()
  {
    if(_bmi>=25)
      return 'OverWeight';
    else if(_bmi>=18.5)
      return 'Normal';
    else
      return 'Underweight';
  }

  String GetInterpretation()
  {
    if(_bmi>=25)
      return 'You have higher body weight thsn normal body weight. Try to excercise more.';
    else if(_bmi>=18.5)
      return 'You have normal body weight. Good Job.';
    else
      return 'You have lower body weight thsn normal body weight. Try to eat more.';
  }


}