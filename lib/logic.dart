import 'dart:math';


class Calculate{

  var weight;
  var height;
  double bmi;
  Calculate({this.weight,this.height});

  String calculateBmi()
  {
    bmi = weight/pow(height/100,2);
    return bmi.toStringAsFixed(1);
  }

  String result()
  {
    if(bmi>=25)
      return 'Overweight';
    else if(bmi>18.5)
      return 'Normal';
    else
      return 'Underweight';
  }

  String detail()
  {
    if(bmi>=25)
      return "You have a higher than normal body weight.Try to exercise more.";
    else if(bmi>=18.5)
      return "You have a normal body weight.Good Job!";
    else
      return "You have a lower than normal body weight. You can eat a bit more.";
  }

}