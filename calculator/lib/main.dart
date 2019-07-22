import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

List<String> buttons = [
  '7',
  '8',
  '9',
  '÷',
  '4',
  '5',
  '6',
  'x',
  '1',
  '2',
  '3',
  '-',
  '0',
  'c',
  '=',
  '+'
];

String result = '';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff3C3231),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        result,
                        style:
                            TextStyle(fontSize: 40.0, color: Color(0xffFFFFFF)),
                      )
                    ],
                  ),
                ),
              ),
              GridView.count(
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 2.0,
                shrinkWrap: true,
                crossAxisCount: 4,
                children: List.generate(buttons.length, (index) {
                  return FlatButton(
                    color: Color(0xff6E6562),
                    splashColor: Colors.transparent,
                    highlightColor: Color(0xffA6A1A0),
                    child: Text(
                      buttons[index],
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w100,
                          color: Color(0xffE8E7E7)),
                    ),
                    onPressed: () {
                      if (buttons[index] == 'c') {
                        //清除
                        setState(() {
                          result  = '';
                        });
                      } else if (buttons[index] == '=') {
                        //运算结果
                        String new_result =
                            result.replaceAll('x', '*').replaceAll('÷', '/');
                            if(new_result.endsWith('+') | new_result.endsWith('-') | new_result.endsWith('*') | new_result.endsWith('/')){
                                new_result = new_result.substring(0,new_result.length - 1);
                            }
                        Parser p = new Parser();
                        Expression exp = p.parse(new_result);
                        ContextModel cm = new ContextModel();
                        double eval = exp.evaluate(EvaluationType.REAL, cm);
                        setState(() {
                          result = eval.round().toString();
                        });
                      } else {
                        setState(() {
                        result += buttons[index];
                        print(result);
                        });
                      }
                    },
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

main() {
  runApp(HomeWidget());
}
