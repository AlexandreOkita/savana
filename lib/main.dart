import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Savana',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF487400),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontFamily: "MouseMemoirs",
            fontSize: 50,
            color: Colors.white,
          ),
          button: TextStyle(
            fontFamily: "MouseMemoirs",
            fontSize: 40,
            color: Color(0xFF243110),
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _playersQtt = 5;

  void _incrementCounter() {
    setState(() {
      _playersQtt++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.arrow_back),
            ),
            Expanded(
              flex: 3,
              child: FractionallySizedBox(
                  heightFactor: 0.6,
                  widthFactor: 0.8,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFF789B3F),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 32.0, horizontal: 64),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Número de Jogadores",
                              style: Theme.of(context).textTheme.headline1,
                              textAlign: TextAlign.center,
                            ),
                            Column(
                              children: [
                                const Icon(
                                  Icons.arrow_drop_up,
                                  size: 60,
                                  color: Colors.white,
                                ),
                                Text(
                                  _playersQtt.toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 60,
                                      fontFamily: "MouseMemoirs"),
                                ),
                                const Icon(
                                  Icons.arrow_drop_down,
                                  size: 60,
                                  color: Colors.white,
                                ),
                              ],
                            )
                          ]),
                    ),
                  )),
            ),
            Flexible(
              flex: 1,
              child: Container(
                height: 70,
                width: 160,
                decoration: BoxDecoration(
                    color: const Color(0xffFFDA9C),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    "CONFIRMAR",
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
