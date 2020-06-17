import 'package:flutter/widgets.dart';

class CustomRoute extends PageRoute {
  CustomRoute({
    RouteSettings settings,
    @required this.builder,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.barrierDismissible = false,
    this.barrierLabel,
    this.barrierColor,
    this.maintainState = true,
    bool fullscreenDialog = false,
  }): super(settings: settings, fullscreenDialog: fullscreenDialog);

  // 路由动画持续时间
  @override
  final Duration transitionDuration;

  // 路由是否可以被取消
  @override
  final bool barrierDismissible;

  @override
  final String barrierLabel;

  // 路由过程中的背景颜色
  @override
  final Color barrierColor;

  // 是否保留路由状态
  @override
  final bool maintainState;

  // 组件构建函数
  final WidgetBuilder builder;

  // 构建页面
  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return builder(context);
  }

  // 自定义动画，child 为 buildPage 函数构建出的组件
  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return RotationTransition(
      turns: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget widget;

  SlideRightRoute({this.widget})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return RotationTransition(
              turns: animation,
              child: ScaleTransition(
                scale: animation,
                child: child,
              ),
            );
          },
        );
}
