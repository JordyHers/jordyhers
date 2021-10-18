import 'package:flutter/material.dart';
import 'package:jordyhers/utils/config.dart';
import 'package:jordyhers/utils/constants.dart' as st;

class HomeContentMobile extends StatelessWidget {
  const HomeContentMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: USE BLOCK TO CONTROL THE DIFFERENT PAGES
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: getHeight(context) * 0.55,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(st.macBook_address),
                      //image: AssetImage('assets/images/head_banner.png'),
                      fit: BoxFit.fill)),
              child: Stack(
                children: [
                  Positioned.fill(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    top: 40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Build Responsive',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                fontFamily: 'Montserrat')),
                        Text('websites',
                            style: TextStyle(
                                fontSize: 55,
                                fontWeight: FontWeight.w900,
                                color: Colors.purpleAccent,
                                fontFamily: 'Montserrat')),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Create Modern',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      )),
                  Text('designs',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w700,
                        color: Colors.purpleAccent,
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Container(
                height: getHeight(context) * 0.35,
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(st.macBook_address_subtitle),
                        //image: AssetImage('assets/images/head_banner.png'),
                        fit: BoxFit.cover)),
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
