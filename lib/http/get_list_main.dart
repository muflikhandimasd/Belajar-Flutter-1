import 'package:aplikasi_hello_world/http/get_list_model.dart';
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
                onPressed: () {
                  User.getUsers('2').then((users) {
                    // users.forEach((element) {
                    //   print(element);
                    // });
                    output = '';
                    for (int i = 0; i < users.length; i++) {
                      output = output + '[ ' + users[i].name + ' ]';
                    }
                    setState(() {});
                  });
                },
                child: Text('GET LIST USER'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
