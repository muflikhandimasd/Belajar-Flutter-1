import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

enum ColorEvent { toAmber, toLightBlue }

class ColorBloc extends Bloc<ColorEvent, Color> {
  // kita bikin statenya
  Color _color = Colors.amber;

  @override
  Color get initialState => Colors.amber;

  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {
    _color = (event == ColorEvent.toAmber) ? Colors.amber : Colors.lightBlue;
    yield _color;
    // yield adalah perintah memasukkan data ke dalam Stream
  }
}
