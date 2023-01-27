import 'package:flutter/material.dart';
import 'package:flutter_todo/cart/common/models/product.dart';
import 'package:flutter_todo/cart/common/utils/is_dark.dart';

class ProductSquare extends StatelessWidget {
  final Product product;
  final GestureTapCallback onTap;

  ProductSquare({Key? key, required this.product, required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: product.color,
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            product.name,
            style: TextStyle(
              color: isDark(product.color) ? Colors.white : Colors.black
            ),
          )
        )
      )
    );
  }
}