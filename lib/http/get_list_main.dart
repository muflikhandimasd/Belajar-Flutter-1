import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String output = 'no data';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('API DEMO'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(output),
              ElevatedButton(
                onPressed: () {},
                child: Text('GET LIST USER'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
