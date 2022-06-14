// Shared preferences : untuk menyimpan data data simpel di aplikasi, misal simpan setting
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _controller =
      TextEditingController(text: 'No Name');

  bool isOn = false;

  void saveData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('nama', _controller.text);
    // _controller.text adalah value yang disimpan
    pref.setBool('isOn', isOn);
  }

  Future<String> getNama() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.getString('nama') ?? 'No Name';
  }

  Future<bool> getOn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.getBool('isOn') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Shared Pref Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextField(
                controller: _controller,
              ),
              Switch(
                  value: isOn,
                  onChanged: (newValue) {
                    setState(() {
                      isOn = newValue;
                    });
                  }),
              ElevatedButton(
                onPressed: () {
                  saveData();
                },
                child: Text('Save'),
              ),
              ElevatedButton(
                onPressed: () {
                  getNama().then((nama) {
                    _controller.text = nama;
                    setState(() {});
                  });
                  getOn().then((on) {
                    isOn = on;
                    setState(() {});
                  });
                },
                child: Text('Load'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
