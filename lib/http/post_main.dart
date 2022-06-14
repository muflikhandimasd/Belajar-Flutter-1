import 'package:aplikasi_hello_world/http/post_result_model.dart';
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
  PostResult postResult = null;
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
              Text((postResult != null)
                  ? postResult.id +
                      ' | ' +
                      postResult.name +
                      ' | ' +
                      postResult.job +
                      ' | ' +
                      postResult.created
                  : 'Tidak ada Data'),
              ElevatedButton(
                onPressed: () {
                  PostResult.connectToAPI('Muf', 'Programmer').then((value) {
                    // then untuk dapetin value kembalian
                    postResult = value;
                    // setState() untuk ubah atau refresh tampilan
                    setState(() {});
                  });
                },
                child: Text('POST'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
