import 'dart:collection';
import 'dart:ui';
import 'package:flutter_todo/cart/common/models/user.dart';

final Users users = fetchUsersSync();

Future<Users> fetchUsers() {
  return Future.delayed(const Duration(milliseconds: 200), fetchUsersSync);
}

Users fetchUsersSync() {
  return Users._sample();
}

class Users {
  /// A listing of sample products.
  static const List<User> _sampleUsers = <User>[
    User(1, "Takanao",  Color.fromARGB(255, 222, 223, 229)),
    User(2, "Taro",  Color.fromARGB(255, 244, 245, 248)),
    User(3, "Yamada",  Color.fromARGB(255, 222, 223, 229)),
    User(4, "Mura",  Color.fromARGB(255, 244, 245, 248)),
    User(5, "Json",  Color.fromARGB(255, 222, 223, 229)),
    User(6, "Mori",  Color.fromARGB(255, 244, 245, 248)),
    User(7, "Mexico",  Color.fromARGB(255, 222, 223, 229)),
    User(8, "Tshirt-Taro",  Color.fromARGB(255, 244, 245, 248)),
    User(9, "Jackson", Color.fromARGB(255, 222, 223, 229)),
  ];

  final List<User> _users;

  Users.empty() : _users = [];

  Users._sample() : _users = _sampleUsers;

  bool get isEmpty => _sampleUsers.isEmpty;

  UnmodifiableListView<User> get users => UnmodifiableListView<User>(_users);
}