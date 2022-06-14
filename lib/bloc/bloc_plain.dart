import 'package:aplikasi_hello_world/bloc/color_bloc.dart';
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
  ColorBloc bloc = ColorBloc();

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                // eventSink
                bloc.eventSink.add(ColorEvent.toAmber);
              },
              backgroundColor: Colors.amber,
            ),
            SizedBox(width: 10),
            FloatingActionButton(
              onPressed: () {
                bloc.eventSink.add(ColorEvent.toLightBlue);
              },
              backgroundColor: Colors.lightBlue,
            ),
          ],
        ),
        appBar: AppBar(
          title: Text(
            'BLoC tanpa library',
          ),
        ),
        body: Center(
            // StreamBuilder() : dia akan ngebuild ulang widget setiap kali dia dapat update dari stream
            child: StreamBuilder(
          // stateStream
          stream: bloc.stateStream,
          initialData: Colors.amber,
          builder: (context, snapshot) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: 100,
              height: 100,
              color: snapshot.data,
            );
          },
        )),
      ),
    );
  }
}
