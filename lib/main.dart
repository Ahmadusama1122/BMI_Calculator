import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BMI_calculator(),
    );
  }
}
class BMI_calculator extends StatefulWidget {
  const BMI_calculator({Key? key}) : super(key: key);

  @override
  _BMI_calculatorState createState() => _BMI_calculatorState();
}

class _BMI_calculatorState extends State<BMI_calculator> {
  int customindex=0;
  String result='';
  TextEditingController heightcontroller=TextEditingController();
  TextEditingController weightcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'BMI Calculator',
                style: TextStyle(
              color: Colors.black,
          ),
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
          actions: [
            IconButton(onPressed: (){},
                icon: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Row(
                   children: [
                     radioButton('Man', Colors.blue, 0),
                     radioButton('Women', Colors.blue, 1),
                   ],
                 ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                    'Your Height in cm',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  controller: heightcontroller,
                  decoration: InputDecoration(
                    hintText: 'Your hight in cm',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    )
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Your Weight in kg',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  controller: weightcontroller,
                  decoration: InputDecoration(
                      hintText: 'Your Weight in kg',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      )
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  height: 50.0,
                  child: FlatButton(
                    onPressed: (){
                      double height=double.parse(heightcontroller.value.text);
                      double weight=double.parse(weightcontroller.value.text);
                      CalculateBmi(height, weight);
                    },
                    color: Colors.blue,
                    child: Text('Calculate',
                    style:TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    'Your BMI is',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    '$result',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 44.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void CalculateBmi(double height,double weight){
    double finalresult=weight/(height*height/10000);
    String bmi=finalresult.toStringAsFixed(2);
    setState(() {
      result=bmi;
    });
  }
  void changeindex(int index) {
    setState(() {
      customindex=index;
    });
  }
  Widget radioButton(String value,Color color,int index){
    return Expanded(child: Container(
      margin: EdgeInsets.symmetric(horizontal: 12.0),
      height: 80,
      child: FlatButton(
        color: customindex==index ? color: Colors.grey[200],

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        onPressed: (){
          changeindex(index);
        },
        child: Text(
          value,
          style: TextStyle(
            color: customindex == index ? Colors.white : color,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ));
  }
}

