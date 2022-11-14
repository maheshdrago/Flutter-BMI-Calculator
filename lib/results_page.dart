import 'package:flutter/material.dart';
import 'input_page.dart';
import 'logic.dart';

class ResultsPage extends StatelessWidget {

  var desc,bmi,tag="";
  ResultsPage({this.desc,this.bmi,this.tag});
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
          Text(
            "Your Result",
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 43
            ),
          ),
          Expanded(
            child: ReusableCard(
                color:Color(0xFF1D1E33),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Text(
                      tag.toUpperCase(),
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 20
                      ),
                    ),
                  ),
                  Text(
                    bmi,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 80,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  Center(
                    child: Text(
                      desc,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16
                      ),

                    ),
                  )

                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              height: 65,
              color: Color(0xFFEB1555),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 10),
              child: Center(
                child: Text(
                  "RE-CALCULATE",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),

                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
