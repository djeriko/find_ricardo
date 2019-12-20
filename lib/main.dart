import 'package:big_red_button/ricardo.dart';
import 'package:big_red_button/ricardo2.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  bool tapped = false;
  bool selected = false;

  final FlareControls controls = FlareControls();

  void initState() {
    super.initState();

    final ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      ricardo2();
    });
    detector.startListening();
  }

  void _newRicardo() {
    setState(() {
      selected = !selected;
    });
  }

  void _onButtonTap() {
    controls.play("Untitled");
  }

  void _ricardo() {
    Navigator.push(
        context, CupertinoPageRoute(builder: (context) => Ricardo()));
  }

  void ricardo2() {
    Navigator.push(
        context, CupertinoPageRoute(builder: (context) => RicardoSecond()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        width: 1000,
        child: Image.asset(
          "images/orig2.gif",
        ),
      ),
      body: GestureDetector(
        onTap: _onButtonTap,
        onLongPress: _ricardo,
        onDoubleTap: _newRicardo,
        child: Stack(children: <Widget>[
          AnimatedContainer(
            duration: Duration(seconds: 2),
            alignment: Alignment.center,
            height: selected ? 500 : 800,
            curve: Curves.fastOutSlowIn,
            child: Container(
              width: 120,
              height: 120,
              child: Image.asset(
                "images/orig2.gif",
              ),
            ),
          ),
          FlareActor('images/button3.flr',
              animation: 'Idle',
              alignment: Alignment.center,
              fit: BoxFit.contain,
              controller: controls),
        ]),
      ),
    );
  }
}
