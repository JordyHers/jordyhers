import 'package:flutter/material.dart';

class HomeContentDesktop extends StatelessWidget {
  const HomeContentDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: USE BLOCK TO CONTROL THE DIFFERENT PAGES
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 350,
              color: Colors.indigo,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Container(
                child: ClipRRect(
                  child: Image.asset(
                    "assets/stickers/404Error.png",
                    height: 350,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Container(
                child: ClipRRect(
                  child: Image.asset(
                    "assets/stickers/404Error.png",
                    height: 350,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Container(
                child: ClipRRect(
                  child: Image.asset(
                    "assets/stickers/404Error.png",
                    height: 350,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Container(
                child: ClipRRect(
                  child: Image.asset(
                    "assets/stickers/404Error.png",
                    height: 350,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Container(
                child: ClipRRect(
                  child: Image.asset(
                    "assets/stickers/404Error.png",
                    height: 350,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
