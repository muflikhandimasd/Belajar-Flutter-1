import 'package:flutter/material.dart';
import 'dart:async';

enum ColorEvent {
  toAmber,
  toLightBlue,
}

class ColorBloc {
  Color _color = Colors.amber;

  // Event controller
  StreamController<ColorEvent> _eventController =
      StreamController<ColorEvent>();
  // Inputan
  StreamSink<ColorEvent> get eventSink => _eventController.sink;

  // State Controller
  StreamController<Color> _stateController = StreamController<Color>();
  // Sink = inputan
  StreamSink<Color> get _stateSink => _stateController.sink;
  // Output yang masuk ke UI
  Stream<Color> get stateStream => _stateController.stream;

  void _mapEventToState(ColorEvent colorEvent) {
    if (colorEvent == ColorEvent.toAmber) {
      _color = Colors.amber;
    } else {
      _color = Colors.lightBlue;
    }
    // Hubungkan
    _stateSink.add(_color);
  }

  ColorBloc() {
    // listen ini fungsinya untuk memasangkan method yg akan menerima stream dari eventController yakni method mapEventToState
    _eventController.stream.listen(_mapEventToState);
  }

  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}
