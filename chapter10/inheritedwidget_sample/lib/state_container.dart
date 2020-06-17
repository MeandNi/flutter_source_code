import 'package:flutter/material.dart';
import 'package:inheritedwidget_sample/app_state.dart';

class StateContainer extends StatefulWidget {
  final AppState state;
  final Widget child;

  StateContainer({
    @required this.child,
    this.state,
  });

  static StateContainerState of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_InheritedStateContainer>()
        .data;
  }

  @override
  State<StatefulWidget> createState() => StateContainerState();
}

class StateContainerState extends State<StateContainer> {
  AppState state;

  void addItem(Item item) {
    setState(() {
      state.items.add(item);
    });
  }

  void removeItem(Item item) {
    setState(() {
      state.items.remove(item);
    });
  }

  @override
  void initState() {
    if (widget.state != null) {
      state = widget.state;
    } else {
      state = AppState();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }
}

class _InheritedStateContainer extends InheritedWidget {
  StateContainerState data;

  _InheritedStateContainer(
      {Key key, @required this.data, @required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}

class StateNotify extends StatefulWidget {
  @override
  _StateNotifyState createState() => _StateNotifyState();
}

class _StateNotifyState extends State<StateNotify> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
