import 'package:flutter/material.dart';

int num = 0;

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(num.toString()),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  child: Text('PressMe'),
                  onPressed: () {
                    setState(() {
                      num++;
                    });
                    print(num.toString());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

main(){
  runApp(HomeWidget());
}
