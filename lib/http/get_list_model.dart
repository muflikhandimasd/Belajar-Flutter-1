import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  String id;
  String name;

  User({this.id, this.name});

  factory User.createUser(Map<String, dynamic> object) {
    return User(
      id: object['id'].toString(),
      name: object['first_name'] + ' ' + object['last_name'],
    );
  }

  static Future<List<User>> getUsers(String page) async {
    String apiURL = 'https://reqres.in/api/users?page=' + page;

    var apiResult = await http.get(apiURL);
    var jsonObject = jsonDecode(apiResult.body);

    List<dynamic> listUsers = (jsonObject as Map<String, dynamic>)['data'];

    List<User> users = [];
    for (int i = 0; i < listUsers.length; i++) {
      users.add(User.createUser(listUsers[i]));
    }

    return users;
  }
}


/**EXAMPLE
 * const jsonString =
    '{"text": "foo", "value": 1, "status": false, "extra": null}';

final data = jsonDecode(jsonString);
print(data['text']); // foo
print(data['value']); // 1
print(data['status']); // false
print(data['extra']); // null

const jsonArray = '''
  [{"text": "foo", "value": 1, "status": true},
   {"text": "bar", "value": 2, "status": false}]
''';

final List<dynamic> dataList = jsonDecode(jsonArray);
print(dataList[0]); // {text: foo, value: 1, status: true}
print(dataList[1]); // {text: bar, value: 2, status: false}

final item = dataList[0];
print(item['text']); // foo
print(item['value']); // 1
print(item['status']); // false
 */