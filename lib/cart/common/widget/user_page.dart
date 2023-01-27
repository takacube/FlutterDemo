import 'package:flutter/material.dart';
import 'package:flutter_todo/cart/common/models/user.dart';
import 'package:flutter_todo/cart/common/models/users.dart';
import 'package:flutter_todo/cart/common/utils/is_dark.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key, required this.user}) :super(key: key);
  final String user;
  static const routeName = '/user';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${this.user}')
      ),
      body: ListView(
      children: users.users.map((user) => UserName(user: user)).toList())
    );
  }
}

class UserName extends StatelessWidget {
  const UserName({Key? key, required this.user}) :super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: isDark(user.color)
      ? Colors.white
      : Colors.black
    );
    return Container(
      color: (user.id % 2 == 0)? const Color.fromARGB(255, 222, 223, 229) : const Color.fromARGB(255, 244, 245, 248),
      //margin: 123,
      child: ListTile(
        title: Text(
          user.name,
          style: textStyle,
        ),
        trailing: CircleAvatar(
          backgroundColor: const Color(0x33FFFFFF),
          child: Text('id: ${user.id}', style: textStyle)
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      )
    );
  }
}