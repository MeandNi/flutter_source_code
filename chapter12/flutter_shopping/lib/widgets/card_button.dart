import 'package:flutter/material.dart';

class CartButton extends StatefulWidget {
  final int itemCount; // 展示的数字
  final Color badgeColor; // 原点背景色
  final Color badgeTextColor; // 数字颜色

  CartButton({
    Key key,
    @required this.itemCount,
    this.badgeColor: Colors.red,
    this.badgeTextColor: Colors.white,
  }) : super(key: key);

  @override
  CartButtonState createState() {
    return CartButtonState();
  }
}

class CartButtonState extends State<CartButton>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  final Tween<Offset> _badgePositionTween = Tween(
    begin: const Offset(-0.5, -0.5),
    end: const Offset(0.0, 0.0),
  );

  @override
  Widget build(BuildContext context) {
    if (widget.itemCount == 0) {
      return Icon(Icons.shopping_cart);
    }

    return Stack(
        overflow: Overflow.visible,
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
                              fontSize: 12.0,
                              color: widget.badgeTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                          )))))
        ]);
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
