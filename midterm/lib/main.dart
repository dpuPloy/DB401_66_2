import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: const Scaffold(
      body: MyPanel(),
    ),
    theme: ThemeData(
        textTheme: const TextTheme(
            button: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold))),
  ));
}

class MyPanel extends StatefulWidget {
  const MyPanel({super.key});

  @override
  State<MyPanel> createState() => _MyPanelState();
}

class _MyPanelState extends State<MyPanel> {
  int Bg = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image:
                      AssetImage(Bg == 1 ? 'images/bg1.jpg' : 'images/bg2.jpg'),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Bg = 1;
                    });
                  },
                  child: Text('ขึ้นเขา'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.teal)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Bg = 2;
                    });
                  },
                  child: Text('เข้าป่า'),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.purple)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
