import 'package:flutter/material.dart';

class LogoSection extends StatelessWidget {
  const LogoSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60.0),
      child: Container(
        child: Column(
          children: [
            for (int i = 2; i <= 12; i++)
              Image.asset('assets/png/pngegg-$i.png'),
          ],
        ),
      ),
    );
  }
}
