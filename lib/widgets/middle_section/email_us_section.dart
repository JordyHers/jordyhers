import 'package:flutter/material.dart';
import 'package:jordyhers/utils/config.dart';
import 'package:jordyhers/utils/theme.dart';

class EmailUs extends StatelessWidget {
  final bool isMobile;

  EmailUs({Key? key, required this.isMobile}) : super(key: key);
  TextEditingController _controller = TextEditingController();
  String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isMobile
          ? const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50)
          : const EdgeInsets.symmetric(horizontal: 250.0, vertical: 50),
      child: Card(
        borderOnForeground: true,
        color: Colors.grey.shade300,
        elevation: 10,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 50),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Please contact me',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 21,
                      color: Colors.grey.shade800),
                ),
                SizedBox(height: getHeight(context) / 25),
                SelectableText(
                  'Let us know about you, send us an email if you need more information or if you have a project.\n\n '
                  'We will be glad to send you feedback. As we know te flutter community '
                  'is still growing up. So you can be a part of it.',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: Colors.grey.shade900),
                ),
                SizedBox(height: getHeight(context) / 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: getHeight(context) * 0.10,
                      width: getWidth(context) * 0.85,
                      child: TextField(
                        controller: _controller,
                        onChanged: (value) {
                          text = value;
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), hintText: 'Email'),
                      ),
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(gradient: Style.gradient),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.transparent),
                        onPressed: () {
                          if (_controller.text.isNotEmpty) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    title: Text(
                                      'Thank You!',
                                      style: TextStyle(
                                          color: Colors.purpleAccent,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    content: Text(
                                      'We are glad to receive your email and\n we will contact you soon\n',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Close')),
                                    ],
                                  );
                                });
                          } else {
                            _controller.clear();
                          }
                          _controller.clear();
                        },
                        child: SizedBox(child: Text('Contact Us')),
                      ),
                    )
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
