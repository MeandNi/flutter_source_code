import 'package:flutter/material.dart';
import 'package:flutter_shopping/pages/shopping_search_delegate.dart';
import 'package:meta/meta.dart';

class Backdrop extends StatefulWidget {
  const Backdrop({
    @required this.frontLayer,
    @required this.backLayer,
    @required this.frontTitle,
    @required this.backTitle,
    @required this.controller,
  });

  final Widget frontLayer;
  final Widget backLayer;
  final Widget frontTitle;
  final Widget backTitle;
  final AnimationController controller;

  @override
  _BackdropState createState() => _BackdropState();
}

class _BackdropState extends State<Backdrop>
    with SingleTickerProviderStateMixin {
  final GlobalKey _backdropKey = GlobalKey(debugLabel: 'Backdrop');
  AnimationController _controller;
  Animation<RelativeRect> _layerAnimation;

  @override
  void initState() {
    super.initState();
    // 初始化动画控制器
    _controller = widget.controller;
  }

  // 前台内容是否可见
  bool get _frontLayerVisible {
    final AnimationStatus status = _controller.status;
    // 这里表示为当动画完成或者正在执行时前台内容可见
    return status == AnimationStatus.dismissed;
  }

  // 点击执行动画，使幕布下拉
  void _toggleBackdropLayerVisibility() {
    setState(() {
      // 如果当前前台可见，执行动画，否则做回滚动画
      _frontLayerVisible ? _controller.forward() : _controller.reverse();
    });
  }

  Animation<RelativeRect> _getLayerAnimation(double layerTop) {
    return RelativeRectTween(
      begin: RelativeRect.fill,
      end: RelativeRect.fromLTRB(0.0, layerTop, 0.0, 0.0),
    ).animate(_controller);
  }

  Widget _buildStack(BuildContext context, BoxConstraints constraints) {
    print(_controller.status);
    const double layerTitleHeight = 48.0;
    final Size layerSize = constraints.biggest;
    final double layerTop = layerSize.height - layerTitleHeight;

    _layerAnimation = _getLayerAnimation(layerTop);

    return Stack(
      key: _backdropKey,
      children: <Widget>[
        widget.backLayer,
        PositionedTransition(
          rect: _layerAnimation,
          child: Container(
            color: Colors.white,
            child: widget.frontLayer,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    final AppBar appBar = AppBar(
      titleSpacing: 0.0,
      title: _BackdropTitle(
        listenable: _controller.view,
        onPress: _toggleBackdropLayerVisibility,
        frontTitle: widget.frontTitle,
        backTitle: widget.backTitle,
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search, semanticLabel: 'login'),
          onPressed: () {
            showSearch(context: context, delegate: ShoppingSearchDelegate());
          },
        ),
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: LayoutBuilder(
        builder: _buildStack,
      ),
    );
  }
}

class _BackdropTitle extends AnimatedWidget {
  const _BackdropTitle({
    Key key,
    Listenable listenable,
    this.onPress,
    @required this.frontTitle,
    @required this.backTitle,
  })  : assert(frontTitle != null),
        assert(backTitle != null),
        super(key: key, listenable: listenable);

  final Function onPress;
  final Widget frontTitle;
  final Widget backTitle;

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = CurvedAnimation(
      parent: listenable,
      curve: const Interval(0.0, 0.50),
    );

    return DefaultTextStyle(
      style: Theme.of(context).primaryTextTheme.title,
      softWrap: false,
      overflow: TextOverflow.ellipsis,
      child: Row(children: <Widget>[
        // branded icon
        SizedBox(
          width: 72.0,
          child: IconButton(
            padding: const EdgeInsets.only(right: 8.0),
            onPressed: onPress,
            icon: Stack(children: <Widget>[
              Opacity(
                opacity: 1 - animation.value,
                child: const ImageIcon(
                    AssetImage('images/slanted_menu.png')),
              ),
              FractionalTranslation(
                translation: Tween<Offset>(
                  end: Offset.zero,
                  begin: const Offset(1.0, -0.1),
                ).evaluate(animation),
                child: FlutterLogo(
                  size: 30,
                  colors: Colors.pink,
                ),
              )
            ]),
          ),
        ),
        Stack(
          children: <Widget>[
            Opacity(
              opacity: animation.value,
              child: backTitle,
            ),
            Opacity(
              opacity: 1 - animation.value,
              child: FractionalTranslation(
                translation: Tween<Offset>(
                  begin: const Offset(0.5, 0.0),
                  end: Offset.zero,
                ).evaluate(animation),
                child: frontTitle,
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
