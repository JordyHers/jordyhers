import 'package:flutter/material.dart';
import 'package:jordyhers/utils/constants.dart' as st;
import 'package:jordyhers/utils/theme.dart';

class CenteredView extends StatelessWidget {
  final Widget child;

  const CenteredView({Key? key, @required required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      color: Theme.of(context).backgroundColor,
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxWidth: screenSize.width, maxHeight: screenSize.height),
        child: child,
      ),
    );
  }
}
