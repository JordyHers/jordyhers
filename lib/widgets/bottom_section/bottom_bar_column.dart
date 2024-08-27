import 'package:flutter/material.dart';
import 'package:jordyhers/utils/enums.dart';

class BottomBar extends StatelessWidget {
  final PlatformView platformView;

  const BottomBar(this.platformView, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(30),
        color: Colors.black,
        child: switch (platformView) {
          PlatformView.mobile => Column(
              children: [
                SizedBox(height: 20),
                Container(
                  color: Colors.blueGrey,
                  width: double.maxFinite,
                  height: 1,
                ),
                SizedBox(height: 20),
                Text(
                  'Copyright © 2021 | JordyHers.com',
                  style: TextStyle(
                    color: Colors.blueGrey[300],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          PlatformView.web => Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [],
                ),
                SizedBox(height: 20),
                Text(
                  'Copyright © 2021 | JordyHers.com',
                  style: TextStyle(
                    color: Colors.blueGrey[300],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
        });
  }
}
