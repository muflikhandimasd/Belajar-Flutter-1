import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

enum ColorEvent { toAmber, toLightBlue }

class ColorBloc extends HydratedBloc<ColorEvent, Color> {
  @override
  Color get initialState => super.initialState ?? Colors.amber;

  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {
    yield (event == ColorEvent.toAmber) ? Colors.amber : Colors.lightBlue;
    // yield adalah perintah memasukkan data ke dalam Stream
  }

  @override
  Color fromJson(Map<String, dynamic> json) {
    try {
      return Color(json['color'] as int);
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  // pakai int karena Color gabisa disimpen dalam bentuk JSON
  @override
  Map<String, int> toJson(Color state) {
    try {
      return {'color': state.value};
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
