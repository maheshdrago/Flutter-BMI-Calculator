import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_widget.dart';
import 'results_page.dart';
import 'logic.dart';

const ktext = TextStyle(
                  color: Color(0xFF8D8E98),
                  fontSize: 18
              );
const activeColor = Color(0xFF1D1E33);
const inactiveColor = Color(0xFF111328);

enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  var maleColor = inactiveColor;
  var femaleColor = inactiveColor;
  var height = 180.0;
  var weight = 60;
  var selectedGender;
  var age=10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "BMI Calculator",
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(

                    child: ReusableCard(
                      onPress: (){
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                        color:selectedGender==Gender.male?activeColor:inactiveColor,
                        child: IconWidget(
                          text: "MALE",
                          icon: Icon(FontAwesomeIcons.mars,size: 80,color: Colors.white,),
                        ),
                    )
                ),

                Expanded(

                    child: ReusableCard(
                        onPress: (){
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        color:Gender.female==selectedGender?activeColor:inactiveColor,
                        child: IconWidget(
                        text: "FEMALE",
                        icon: Icon(FontAwesomeIcons.venus,size: 80,),
                      ),
                    )
                )

              ],
            ),
          ),


          Expanded(
            child: ReusableCard(

                color:Color(0xFF1D1E33),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style: TextStyle(
                        color: Color(0xFF8D8E98),
                        fontSize: 18
                      ),

                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toInt().toString(),
                          style: TextStyle(

                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.w900
                          ),
                        ),

                        Text(
                          "cm",

                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white

                          ),
                        )

                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTickMarkColor: Color(0xFF8D8E98),
                        thumbColor: Color(0xFFEB1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
                        overlayColor: Color(0x29EB1555)
                      ),
                      child: Slider(
                        value: height,
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double val)
                        {
                          setState(() {
                            height = val;
                          });

                        },
                      ),
                    )

                  ],
                )
            )
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                        color:Color(0xFF1D1E33),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: ktext
                            ),
                            Text(
                              weight.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.w700
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onpress: (){
                                      setState(() {
                                        weight +=1;
                                      });
                                    },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onpress: (){
                                    setState(() {
                                      weight-=1;
                                    });
                                  },
                                )

                              ],
                            )
                          ],
                        ),
                    )
                ),

                Expanded(
                    child: ReusableCard(
                        color:Color(0xFF1D1E33),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "AGE",
                              style: ktext,
                            ),
                            Text(
                              age.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.w900
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onpress: (){
                                    setState(() {
                                      age+=1;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onpress: (){
                                    setState(() {
                                      age-=1;
                                    });
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                    )
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              var calc = Calculate(weight: weight,height: height);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context){
                  return ResultsPage(bmi: calc.calculateBmi(),desc: calc.detail(),tag:calc.result() ,);
                })
              );
            },
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top:10),
              child: Center(

                child: Text(
                  "CALCULATE",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500

                  ),

                ),
              ),

              color: Color(0xFFEB1555),
              width: double.infinity,
              height: 60,
            ),
          )

        ],
      )
    );
  }
}

class ReusableCard extends StatelessWidget {

  final Widget child;
  final Color color;
  final Function onPress;

  ReusableCard({@required this.color,this.child,this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child:Container(
      child: child,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color
      ),
      )
    );
  }
}

class RoundIconButton extends StatelessWidget {

  final onpress;
  final IconData icon;

  RoundIconButton({this.onpress,this.icon});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56
      ),
      onPressed: onpress,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),

    );
  }
}




