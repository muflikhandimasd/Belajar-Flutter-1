import 'package:flutter/material.dart';

import '../model/user.dart';

class UserCard extends StatelessWidget {
  final User user;
  UserCard(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.blueGrey[100],
          // ignore: prefer_const_literals_to_create_immutables
          boxShadow: [
            const BoxShadow(
              color: Color(0x55000000),
              offset: Offset(1, 1),
              blurRadius: 7,
            ),
          ],
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.blueGrey)),
      child: Row(
        children: <Widget>[
          Container(
            width: 75,
            height: 75,
            margin: const EdgeInsets.only(
              right: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                15,
              ),
              image: DecorationImage(
                image: NetworkImage(
                  user.avatar,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('ID: ' + user.id),
              Text('Nama: ' + user.firstName + ' ' + user.lastName),
              Text('Email: ' + user.email),
            ],
          ),
        ],
      ),
    );
  }
}
