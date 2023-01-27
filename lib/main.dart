import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());




class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CartModel(),
      child: MaterialApp(
        title: 'Scoped Model',
        theme: appTheme,
        home: MyHomePage(),
        routes: <String, WidgetBuilder>{
          CartPage.routeName: (context) => CartPage()
        }
      )
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartBloc = CartProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('BloC'),
        actions: <Widget>[
          StreamBuilder<int>(
            stream: cartBloc.itemCount,
            initialData: 0,
            builder: (context, snapshot) => CartButton(
              itemCount: snapshot.data,
              onPressed: () {
                Navigator.of(context).pushNamed(CartPage.routeName);
              }
            )
          )
        ]
      ),
      body: ProductGrid(),
    );
  }
}

class ProdcutGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GridView.count(
    crossAxisCount: 2,
    children: catalog.products.map((product) {
      return ScopedModelDescendant<CartModel>(
        builder: (context, _, model) => productSquare(
          product: product,
          onTap: () => {
            CartBloc.addition.add(product);
          }
        )
      );
    }).toList(),
    );
}

class CartPage extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: ScopedModelDescendant<CartModel>(
        builder: (context, _, model) => model !=  null
         ? ListView(
          children: model.items
              .map((item) => ItemTitle(item: item))
              .toList())
        : Center(
          child: Text('Empty',
          style: Theme.of(context).textTheme.displayMedium)
        )
      )
    );
  }
}



class CartBloc {
  final _cart = Cart();

  Sink<Product> get addition => _additionControler.sink;

  final _additionControler = StreamController<Product>();

  Stream<int> get itemCount => _itemCountSubject.stream;

  final _itemCountSubject = BehaviorSubject<int>();

  CartBloc() {
    _additionControler.stream.listen(_handle);
  }

  void _handle(Product product) {
    _cart.add(product);
    _itemCountSubject.add(_cart.itemCount);
  }
}
