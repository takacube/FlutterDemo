import 'package:flutter/material.dart';
import 'package:flutter_todo/cart/common/models/cart.dart';
import 'package:flutter_todo/cart/common/models/catalog.dart';
import 'package:flutter_todo/cart/common/models/product.dart';
import 'package:flutter_todo/cart/common/widget/cart_button.dart';
import 'package:flutter_todo/cart/common/widget/cart_page.dart';
import 'package:flutter_todo/cart/common/widget/product_square.dart';
import 'package:flutter_todo/cart/common/widget/theme.dart';
import 'package:flutter_todo/cart/common/widget/user_button.dart';
import 'package:flutter_todo/cart/common/widget/user_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final cart = Cart();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vanilla',
      theme: appTheme,
      //home: MyHomePage(cart: cart),
      routes: <String, WidgetBuilder>{
        "/": (context) => MyHomePage(cart: cart),
        CartPage.routeName: (context) => CartPage(cart: cart),
        UserPage.routeName: (context) => const UserPage(user: "Takanao"),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Cart cart;

  const MyHomePage({
    Key? key,
    required this.cart,
  }) : super(key: key);

  @override
  createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  _updateCart(Product product) {
    setState(() => widget.cart.add(product));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vanilla'),
        actions: <Widget>[
          // The shopping cart button in the app bar
          CartButton(
            itemCount: widget.cart.itemCount,
            onPressed: () {
              Navigator.of(context).pushNamed(CartPage.routeName);
            },
          ),
          UserButton(itemCount: 1, onPressed: () => Navigator.of(context).pushNamed(UserPage.routeName))
        ],
      ),
      body: ProductGrid(
        cart: widget.cart,
        updateProduct: _updateCart,
      ),
    );
  }
}

class ProductGrid extends StatelessWidget {
  final Cart cart;
  final Function(Product) updateProduct;

  ProductGrid({
    Key? key,
    required this.cart,
    required this.updateProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: catalog.products.map((product) {
        return ProductSquare(
          product: product,
          onTap: () => updateProduct(product),
        );
      }).toList(),
    );
  }
}