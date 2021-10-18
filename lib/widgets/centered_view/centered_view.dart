import 'package:flutter/material.dart';

class CenteredView extends StatelessWidget {
  final Widget child;

  const CenteredView({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.white38,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxWidth: screenSize.width, maxHeight: screenSize.height),
        child: child,
      ),
    );
  }
}
