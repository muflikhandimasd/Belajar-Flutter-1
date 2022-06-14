import 'package:aplikasi_hello_world/http/get_model.dart';
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
  User user = null;
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
              Text((user != null)
                  ? user.id + ' | ' + user.name
                  : 'Tidak ada Data'),
              ElevatedButton(
                onPressed: () {
                  User.connectToAPI('2').then((value) {
                    user = value;
                    setState(() {});
                  });
                },
                child: Text('GET'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
