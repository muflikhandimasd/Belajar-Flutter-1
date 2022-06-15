// import 'package:aplikasi_hello_world/bloc_package/bloc_package_main.dart';
import 'package:aplikasi_hello_world/mvvm/bloc_view_model/user_bloc.dart';
import 'package:aplikasi_hello_world/mvvm/model/user.dart';
import 'package:aplikasi_hello_world/mvvm/ui/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        builder: (context) => UserBloc(),
        child: MainPage(),
      ),
    );
  }
}
