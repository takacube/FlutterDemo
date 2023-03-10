import 'dart:async';
import 'dart:collection';
import 'dart:math';
import 'dart:ui' show Color;

import 'package:flutter/material.dart';
import 'package:flutter_todo/cart/common/models/product.dart';


/// Hard-coded catalog of [Product]s.
final Catalog catalog = fetchCatalogSync();

Future<Catalog> fetchCatalog() {
  return Future.delayed(const Duration(milliseconds: 200), fetchCatalogSync);
}

Catalog fetchCatalogSync() {
  return Catalog._sample();
}

Future<Null> updateCatalog(Catalog catalog) {
  return Future.delayed(const Duration(milliseconds: 200), () {
    catalog._products.clear();
    catalog._products.addAll(Catalog._sampleProducts);
  });
}

class Catalog {
  /// A listing of sample products.
  static const List<Product> _sampleProducts = <Product>[
    Product(42, "Sweater",  Color(0xFF536DFE)),
    Product(1024, "Socks",  Color(0xFFFFD500)),
    Product(1337, "Shawl",  Color(0xFF1CE8B5)),
    Product(123, "Jacket",  Color(0xFFFF6C00)),
    Product(201805, "Hat",  Color(0xFF574DDD)),
    Product(128, "Hoodie",  Color(0xFFABD0F2)),
    Product(321, "Tuxedo",  Color(0xFF8DA0FC)),
    Product(1003, "Shirt",  Color(0xFF1CE8B5)),
    Product(11, "sample", Colors.black),
  ];

  final List<Product> _products;

  Catalog.empty() : _products = [];

  Catalog._sample() : _products = _sampleProducts;

  bool get isEmpty => _products.isEmpty;

  /// An immutable listing of the products.
  UnmodifiableListView<Product> get products =>
      UnmodifiableListView<Product>(_products);
}