import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
            body: ColorRamdomizer(),
                  ),
      );
  }
}

class ColorRamdomizer extends StatefulWidget {

  @override
  _ColorRamdomizerState createState() => _ColorRamdomizerState();
}


class _ColorRamdomizerState extends State<ColorRamdomizer> {
  final Random random = Random();
  Color color = Colors.white;

  void  _navigateToNewScreen(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewScreen()));
  }

  randomColorGenerator(){
    Color tmpColor = Color.fromARGB( random.nextInt(256),
                                random.nextInt(256),
                                random.nextInt(256),
                                random.nextInt(256));
    setState(() {
      color = tmpColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.photo),
        onPressed: (){_navigateToNewScreen(context);},
      ),
      body: Container(
        child: InkWell(
          onTap: () {
                randomColorGenerator();
              },
          child: Center(
            child: Text('Hey there',
              style: TextStyle(
                  fontSize: 20.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ),
      //
    );
  }
}

class NewScreen extends StatelessWidget {
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(80),
          child: Image.asset("assets/images/" + random.nextInt(7).toString() + ".jpg",height: 300,
            width: 300, ),
        )
      ),
    );
  }
}
