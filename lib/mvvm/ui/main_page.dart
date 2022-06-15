import 'dart:math';

import 'package:aplikasi_hello_world/mvvm/bloc_view_model/user_bloc.dart';
import 'package:aplikasi_hello_world/mvvm/model/user.dart';
import 'package:aplikasi_hello_world/mvvm/ui/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  final Random random = Random();
  @override
  Widget build(BuildContext context) {
    UserBloc bloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('MVVM Demo'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blueGrey,
            ),
            onPressed: () {
              bloc.dispatch(random.nextInt(10) + 1);
            },
            child: Text(
              'Pict Random User',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          BlocBuilder<UserBloc, User>(
              builder: (context, user) =>
                  (user is UnitializedUser) ? Container() : UserCard(user))
        ],
      ),
    );
  }
}
