import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class NavigationBarMobile extends StatelessWidget {
  final ItemScrollController scrollController;

  const NavigationBarMobile(this.scrollController, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Theme.of(context).primaryTextTheme.bodySmall!.color,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          Spacer()
        ],
      ),
    );
  }
}
