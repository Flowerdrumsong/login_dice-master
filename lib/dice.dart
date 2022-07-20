import 'package:flutter/material.dart';
import 'dart:math';
// import 'package:fluttertoast/fluttertoast.dart';

class Dice extends StatefulWidget {
  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftDice=1;
  int rightDice=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text('Dice game'),
        ),
        body: Builder(
          builder: (BuildContext context) {
            return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: Image.asset('image/dice$leftDice.png')),
                          SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                              child: Image.asset('image/dice$rightDice.png')),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 60.0,
                    ),
                    ButtonTheme(
                      minWidth: 100.0,
                      height: 60.0,
                      child: ElevatedButton(
                        child: Icon(
                          Icons.play_arrow,
                          size: 40.0,
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Colors.lime),
                        ),
                        onPressed: () {
                          setState(() {
                            leftDice = Random().nextInt(6) + 1;
                            rightDice = Random().nextInt(6) + 1;
                          });
                          showSnackBarResult(context, leftDice, rightDice);
                          // showToast(
                          //   "Left dice:{$leftDice}, Right dice: {$rightDice}"
                          // );
                        },
                      ),
                    )
                  ],
                ));
          }
        ));
  }
}

void showSnackBarResult(BuildContext context, int leftDice, int rightDice){
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text(
        'Left dice:$leftDice, Right dice: $rightDice',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 1),
    backgroundColor: Colors.lime,
  ));
}
// void showToast(String message){
//   Fluttertoast.showToast(msg: message,
//   backgroundColor: Colors.white,
//     toastLength: Toast.LENGTH_SHORT,
//     gravity:ToastGravity.BOTTOM
//   );
// }
