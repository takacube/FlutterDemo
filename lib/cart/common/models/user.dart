import 'dart:ui' show Color;

class User {
  /// The unique identifier of the product.
  final int id;

  /// The default text to display.
  final String name;

  /// A color associated with the product.
  final Color color;

  const User(this.id, this.name, this.color);

  @override
  String toString() => "$name (id=$id)";
}