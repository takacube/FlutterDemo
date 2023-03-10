import 'package:flutter/material.dart';

class CartButton extends StatefulWidget {
  final VoidCallback onPressed;
  final int itemCount;
  final Color badgeColor;
  final Color badgeTextColor;

  const CartButton({
    Key? key,
    required this.itemCount,
    required this.onPressed,
    this.badgeColor=Colors.red,
    this.badgeTextColor=Colors.white,
    }) :  assert(itemCount >= 0),
          //assert(badgeColor != 0),
          //assert(badgeTextColor != null),
          super(key: key);
  @override
  CartButtonState createState() {
    return CartButtonState();
  }
}

class CartButtonState extends State<CartButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

    final Tween<Offset> _badgePositionTween = Tween(
      begin: const Offset(-5, 0.9),
      end: const Offset(0.0, 0.0),
    );

    @override
    Widget build(BuildContext context) {
      return IconButton(
        icon: Stack(
          children: [
            Icon(Icons.shopping_cart),
            Positioned(
              top: -8.0,
              right: -3.0,
              child: SlideTransition(
                position: _badgePositionTween.animate(_animation),
                child: Material(
                    type: MaterialType.circle,
                    elevation: 2.0,
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        widget.itemCount.toString(),
                        style: TextStyle(
                          fontSize: 13.0,
                          color: widget.badgeTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
              ),
            ),
          ],
        ),
        onPressed: widget.onPressed
      );
    }

    @override
    void didUpdateWidget(CartButton oldWidget) {
      if (widget.itemCount != oldWidget.itemCount) {
        _animationController.reset();
        _animationController.forward();
      }
      super.didUpdateWidget(oldWidget);
    }

    @override
    void dispose() {
      _animationController.dispose();
      super.dispose();
    }

    @override
    void initState() {
      super.initState();
        _animationController = AnimationController(
          duration: const Duration(milliseconds: 500),
          vsync: this,
        );
        _animation =
          CurvedAnimation(parent: _animationController, curve: Curves.elasticOut);
        _animationController.forward();
    }
  }