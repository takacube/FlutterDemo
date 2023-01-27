import 'package:flutter/material.dart';

class MyBottun extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
    ElevatedButton(
      child: Text("greet"),
      onPressed: _submit,
    );

    void _submit() {
      setState(String greetMsg) {
        final greeting = greetMsg;
        print(greeting);
      }
      setState("good morning");
    }
}

class Interface extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("sample")),
      body: MyBottun()
    );
  }
}

/*
class MyInheritedWidget extends InheritedWidget {

}
*/

class CartModel extends Model {
  final _cart = Cart();

  List<CartItem> get items => _cart.items;

  int get itemCount => _cart.itemCount;

  void add(Product product) {
    _cart.add(product);
    notifyListeners();
  }
}


