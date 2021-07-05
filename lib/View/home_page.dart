import 'package:flutter/material.dart';
import 'package:jordyhers/View/blog_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: USE BLOCK TO CONTROL THE DIFFERENT PAGES
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.indigo,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:4.0),
                  child: ClipOval(
                    child: Image.asset(
                      "assets/stickers/1625471355257.png",
                      height: 54,
                    ),
                  ),
                ),
                SizedBox(width: 50),
                Text(
                  "Jordy",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
                Text("Hers.com",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.purpleAccent))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                    onPressed: () {},
                    child: Text("Discover",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: Colors.white))),
                FlatButton(
                    onPressed: () {},
                    child: Text("Our Blog",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: Colors.white))),
                FlatButton(
                    onPressed: () {},
                    child: Text("Services",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: Colors.white))),
                FlatButton(
                    onPressed: () {},
                    child: Text("About US",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: Colors.white))),
              ],
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 350,
              color: Colors.indigo,
            ),
            Padding(
              padding: const EdgeInsets.only(top:60.0),
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
