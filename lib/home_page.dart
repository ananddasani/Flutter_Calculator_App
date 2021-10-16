import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //variables needed to sove
  int firstNumber = 0;
  int secondNumber = 0;

  String textToDisplay = "";
  String result = "";
  String operatorToPerform = "";

  //backend function
  void solve(String btnValue) {
    //if c is pressed then everything will be null
    if (btnValue == "C") {
      firstNumber = 0;
      secondNumber = 0;

      textToDisplay = "";
      result = "";
      operatorToPerform = "";
    } else if (btnValue == "+" ||
        btnValue == "-" ||
        btnValue == "X" ||
        btnValue == "/") {
      firstNumber = int.parse(textToDisplay);
      result = "";
      operatorToPerform = btnValue;
    } else if (btnValue == "=") {
      secondNumber = int.parse(textToDisplay);
      if (operatorToPerform == "+")
        result = (firstNumber + secondNumber).toString();
      if (operatorToPerform == "-")
        result = (firstNumber - secondNumber).toString();
      if (operatorToPerform == "X")
        result = (firstNumber * secondNumber).toString();
      if (operatorToPerform == "/")
        result = (firstNumber / secondNumber).toString();
    } else
      result = int.parse(textToDisplay + btnValue).toString();

    //set the state
    setState(() {
      textToDisplay = result;
    });
  }

  //this will make the custom buttons
  Widget customButton(String btnValue) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => solve(btnValue),
        child: Text(
          "$btnValue",
          style: TextStyle(
            fontSize: 25.0,
            fontFamily: "Times New Roman",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/me.png",
            fit: BoxFit.cover,
            colorBlendMode: BlendMode.darken,
            color: Colors.black45,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "$textToDisplay",
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 25.0,
                      fontFamily: "Times New Roman",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(8.0)),
              Row(
                children: [
                  customButton("9"),
                  customButton("8"),
                  customButton("7"),
                  customButton("+"),
                ],
              ),
              Row(
                children: [
                  customButton("6"),
                  customButton("5"),
                  customButton("4"),
                  customButton("-"),
                ],
              ),
              Row(
                children: [
                  customButton("3"),
                  customButton("2"),
                  customButton("1"),
                  customButton("X"),
                ],
              ),
              Row(
                children: [
                  customButton("C"),
                  customButton("0"),
                  customButton("="),
                  customButton("/"),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
