import 'package:aplikasi_hello_world/multi_bloc/bloc/color_bloc.dart';
import 'package:aplikasi_hello_world/multi_bloc/bloc/counter_bloc.dart';
import 'package:aplikasi_hello_world/multi_bloc/ui/draft_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorBloc colorBloc = BlocProvider.of<ColorBloc>(context);
    CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return BlocBuilder<ColorBloc, Color>(
      builder: (context, color) => DraftPage(
        backgroundColor: color,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              BlocBuilder<CounterBloc, int>(
                builder: (context, number) => GestureDetector(
                  onTap: () {
                    counterBloc.dispatch(number++);
                  },
                  child: Text(
                    number.toString(),
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      colorBloc.dispatch(ColorEvent.toPink);
                    },
                    child: Container(),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pink,
                      shape: (color == Colors.pink)
                          ? CircleBorder(
                              side: BorderSide(
                                color: Colors.black,
                                width: 3,
                              ),
                            )
                          : const CircleBorder(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      colorBloc.dispatch(ColorEvent.toAmber);
                    },
                    child: Container(),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber,
                      shape: (color == Colors.amber)
                          ? CircleBorder(
                              side: BorderSide(
                                color: Colors.black,
                                width: 3,
                              ),
                            )
                          : const CircleBorder(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      colorBloc.dispatch(ColorEvent.toPurple);
                    },
                    child: Container(),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                      shape: (color == Colors.purple)
                          ? CircleBorder(
                              side: BorderSide(
                                color: Colors.black,
                                width: 3,
                              ),
                            )
                          : const CircleBorder(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
