import 'package:aplikasi_hello_world/bloc_package/color_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<ColorBloc>(
        builder: (context) => ColorBloc(),
        child: MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // perintah untuk ambil object bloc dari rootnya
    ColorBloc bloc = BlocProvider.of<ColorBloc>(context);

    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              bloc.dispatch(ColorEvent.toAmber);
            },
            backgroundColor: Colors.amber,
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              // dispatch = menugaskan
              bloc.dispatch(ColorEvent.toLightBlue);
            },
            backgroundColor: Colors.lightBlue,
          ),
        ],
      ),
      appBar: AppBar(
        title: Text('BLoC dengan flutter_bloc'),
      ),
      body: Center(
        child: BlocBuilder<ColorBloc, Color>(
          builder: ((_, currentColor) => AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: 100,
                height: 100,
                color: currentColor,
              )),
        ),
      ),
    );
  }
}
