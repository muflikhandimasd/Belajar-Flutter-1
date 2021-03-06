import 'package:aplikasi_hello_world/multi_bloc/bloc/color_bloc.dart';
import 'package:aplikasi_hello_world/multi_bloc/bloc/counter_bloc.dart';
import 'package:aplikasi_hello_world/multi_bloc/ui/draft_page.dart';
import 'package:aplikasi_hello_world/multi_bloc/ui/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorBloc, Color>(
      builder: (context, color) => DraftPage(
        backgroundColor: color,
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            BlocBuilder<CounterBloc, int>(
              builder: (context, number) => Text(
                number.toString(),
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SecondPage(),
                  ),
                );
              },
              child: Text(
                'Click to change',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  primary: color, shape: StadiumBorder()),
            ),
          ],
        )),
      ),
    );
  }
}
