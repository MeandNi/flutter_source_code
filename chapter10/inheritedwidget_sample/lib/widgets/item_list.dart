import 'package:flutter/material.dart';
import 'package:inheritedwidget_sample/app_state.dart';
import 'package:inheritedwidget_sample/state_container.dart';

class ItemList extends StatelessWidget {
  ItemList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final container = StateContainer.of(context);

    return Container(
      child: _buildList(container),
    );
  }

  ListView _buildList(StateContainerState container) {
    final items = container.state.items;

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        final item = items[index];

        return ItemView(
          item: item,
          onDismissed: (direction) {
            _removeitem(context, item);
          },
          onTap: () {
            _showUndoSnackbar(context, item);
          }
        );
      },
    );
  }

  void _removeitem(BuildContext context, Item item) {
    StateContainer.of(context).removeItem(item);
    _showUndoSnackbar(context, item);
  }

  void _showUndoSnackbar(BuildContext context, Item item) {
    final snackBar = SnackBar(
      duration: Duration(seconds: 2),
      content: Text(
        item.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );

    Scaffold.of(context).showSnackBar(snackBar);
  }
}

class ItemView extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final Item item;

  ItemView({
    @required this.onDismissed,
    @required this.onTap,
    @required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: new ValueKey(item.title),
      onDismissed: onDismissed,
      child: ListTile(
        onTap: onTap,
        title: Text(
          item.title,
          style: Theme.of(context).textTheme.title,
        )
      ),
    );
  }
}