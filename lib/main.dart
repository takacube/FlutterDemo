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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Catalog'),
        actions: <Widget>[
          ScopedModelDescendant<CartButton>(
            builder: (context, _, model) => CartButton(
              itemCount: 0,
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
          onTap: () => model.add(product),
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