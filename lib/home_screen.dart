import 'package:calculator_app/Buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = "";
  var result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        backgroundColor: Colors.black,
        title: Text("Calculator"),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 60,
                ),
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        userInput.toString(),
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        result.toString(),
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Buttons(
                          title: "AC",
                          color: Colors.blue,
                          onPress: () {
                            setState(() {
                              userInput = "";
                              result = "0";
                            });
                          },
                        ),
                        Buttons(
                          title: "+/-",
                          color: Colors.teal,
                          onPress: () {
                            setState(() {
                              userInput += "+/-";
                            });
                          },
                        ),
                        Buttons(
                          title: "%",
                          color: Colors.teal,
                          onPress: () {
                            setState(() {
                              userInput += "%";
                            });
                          },
                        ),
                        Buttons(
                          title: "/",
                          color: Color(0xffffa00a),
                          onPress: () {
                            setState(() {
                              userInput += "/";
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Buttons(
                          title: "7",
                          onPress: () {
                            setState(() {
                              userInput += "7";
                            });
                          },
                        ),
                        Buttons(
                          title: "8",
                          onPress: () {
                            setState(() {
                              userInput += "8";
                            });
                          },
                        ),
                        Buttons(
                          title: "9",
                          onPress: () {
                            setState(() {
                              userInput += "9";
                            });
                          },
                        ),
                        Buttons(
                          title: "x",
                          color: Color(0xffffa00a),
                          onPress: () {
                            setState(() {
                              userInput += "x";
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Buttons(
                          title: "4",
                          onPress: () {
                            setState(() {
                              userInput +="4";
                            });
                          },
                        ),
                        Buttons(
                          title: "5",
                          onPress: () {
                            setState(() {
                              userInput += "5";                            });
                          },
                        ),
                        Buttons(
                          title: "6",
                          onPress: () {
                            setState(() {
                              userInput += "6";
                            });
                          },
                        ),
                        Buttons(
                          title: "-",
                          color: Color(0xffffa00a),
                          onPress: () {
                            setState(() {
                              userInput += "-";
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Buttons(
                          title: "1",
                          onPress: () {
                            setState(() {
                              userInput += "1";
                            });
                          },
                        ),
                        Buttons(
                          title: "2",
                          onPress: () {
                            setState(() {
                              userInput += "2";
                            });
                          },
                        ),
                        Buttons(
                          title: "3",
                          onPress: () {
                            setState(() {
                              userInput += "3";
                            });
                          },
                        ),
                        Buttons(
                          title: "+",
                          color: Color(0xffffa00a),
                          onPress: () {
                            setState(() {
                              userInput += "+";
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Buttons(
                          title: "0",
                          onPress: () {
                            setState(() {
                              userInput += "0";
                            });
                          },
                        ),
                        Buttons(
                          title: ".",
                          onPress: () {
                            setState(() {
                              userInput += ".";
                            });
                          },
                        ),
                        Buttons(
                          title: "DEL",
                          color: Colors.purple,
                          onPress: () {
                            setState(() {
                              userInput.substring(0, userInput.length - 1);
                            });
                          },
                        ),
                        Buttons(
                          title: "=",
                          color: Colors.green,
                          onPress: () {
                            equalPressed();
                                setState(() {

                                });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void equalPressed() {

    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    result = eval.toString();
  }

}
