import 'package:flutter/material.dart';
import 'package:flutter_todo/cart/common/models/cart.dart';
import 'package:flutter_todo/cart/common/models/cart_ietm.dart';
import 'package:flutter_todo/cart/common/utils/is_dark.dart';


class CartPage extends StatelessWidget {
  const CartPage({Key? key, required this.cart}) :super(key: key);
  final Cart cart;

  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart")
      ),
      body: cart.items.isEmpty
          ? Center(
            child: Text("Empty", style: Theme.of(context).textTheme.displayMedium))
          : ListView(
            children:
                  cart.items.map((item) => ItemTitle(item: item)).toList())
    );
  }
}

class ItemTitle extends StatelessWidget {
  const ItemTitle({Key? key, required this.item}) :super(key: key);
  final CartItem item;

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: isDark(item.product.color)
      ? Colors.white
      : Colors.black
    );
    return Container(
      color: item.product.color,
      child: ListTile(
        title: Text(
          item.product.name,
          style: textStyle,
        ),
        trailing: CircleAvatar(
          backgroundColor: const Color(0x33FFFFFF),
          child: Text(item.count.toString(), style: textStyle)
        ),
      )
    );
  }
}