import 'package:flutter/material.dart';

class UserButton extends StatefulWidget {
  final VoidCallback onPressed;
  final int itemCount;
  final Color badgeColor;
  final Color badgeTextColor;

  const UserButton({
    Key? key,
    required this.itemCount,
    required this.onPressed,
    this.badgeColor=Colors.red,
    this.badgeTextColor=Colors.white,
    }) :  assert(itemCount >= 0),
          super(key: key);
  @override
  UserButtonState createState() {
    return UserButtonState();
  }
}

class UserButtonState extends State<UserButton>{

    @override
    Widget build(BuildContext context) {
      return IconButton(
        icon: Stack(
          children: [const Icon(Icons.supervised_user_circle_sharp)],
        ),
        onPressed: widget.onPressed
      );
    }

    @override
    void initState() {
      super.initState();
    }
  }