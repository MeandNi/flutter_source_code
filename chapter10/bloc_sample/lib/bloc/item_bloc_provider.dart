
import 'package:bloc_sample/bloc/items_bloc.dart';
import 'package:flutter/material.dart';

class ItemBlocProvider extends StatefulWidget {
  final Widget child;
  final ItemsBloC bloc;

  ItemBlocProvider({Key key, @required this.child, @required this.bloc})
      : super(key: key);

  @override
  _BlocProviderState createState() => _BlocProviderState();

  static ItemsBloC of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_BlocProviderInherited>()
        .bloc;
  }
}

class _BlocProviderState extends State<BlocProvider> {
  @override
  Widget build(BuildContext context) {
    return _BlocProviderInherited(bloc: widget.bloc, child: widget.child);
  }

  @override
  void dispose() {
    widget.bloc.close();
    super.dispose();
  }
}

class _BlocProviderInherited extends InheritedWidget {
  final ItemsBloC bloc;

  _BlocProviderInherited({
    Key key,
    @required this.bloc,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_BlocProviderInherited old) => bloc != old.bloc;
}