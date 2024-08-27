import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jordyhers/services/firebase_service.dart';
import 'package:jordyhers/utils/config.dart';
import 'package:jordyhers/utils/enums.dart';
import 'package:provider/provider.dart';

class EmailUs extends StatefulWidget {
  final PlatformView platformView;

  EmailUs(
    this.platformView, {
    Key? key,
  }) : super(key: key);

  @override
  _EmailUsState createState() => _EmailUsState();
}

class _EmailUsState extends State<EmailUs> {
  TextEditingController _controller = TextEditingController();

  String? text;
  bool enabled = true;
  bool emailValid = true;

  _submitDialog(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          title: Text(
            'Thank You!',
            style: GoogleFonts.lora(
              color: Colors.purpleAccent,
              fontWeight: FontWeight.w700,
            ),
          ),
          content: Text(
            'We are glad to receive your email and\n we will contact you soon.\n',
            style: GoogleFonts.lora(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Close',
                style: GoogleFonts.lora(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final firestore = Provider.of<FirestoreService>(context, listen: false);

    final EdgeInsets padding = switch (widget.platformView) {
      PlatformView.mobile =>
        const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20),
      PlatformView.web =>
        const EdgeInsets.symmetric(horizontal: 450.0, vertical: 50),
    };

    return Padding(
      padding: padding,
      child: Card(
        borderOnForeground: true,
        color: Colors.grey.shade200,
        elevation: 10,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Contact Us',
                style: GoogleFonts.lora(
                  fontWeight: FontWeight.w500,
                  fontSize: 21,
                  color: Colors.grey.shade600,
                ),
              ),
              SizedBox(height: ScreenConfig.getHeight(context) / 25),
              SelectableText(
                'Let us know about you, send us an email if you need more information or if you have a project. '
                'We will be glad to send you feedback. As we know the flutter community '
                'is still growing up. So you can be a part of it.',
                style: GoogleFonts.lora(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  height: 1.5,
                  color: Colors.grey.shade500,
                ),
              ),
              SizedBox(height: ScreenConfig.getHeight(context) / 20),
              Column(
                children: [
                  SizedBox(
                    height: ScreenConfig.getHeight(context) * 0.10,
                    width: ScreenConfig.getWidth(context) * 0.85,
                    child: TextField(
                      style: GoogleFonts.lora(color: Colors.deepPurple),
                      enabled: enabled,
                      controller: _controller,
                      onChanged: (value) {
                        setState(() {
                          text = value;
                          emailValid = EmailValidator.validate(value);
                        });
                      },
                      decoration: InputDecoration(
                        errorText: emailValid ? null : 'Enter a valid email',
                        errorStyle: GoogleFonts.lora(color: Colors.red),
                        border: OutlineInputBorder(),
                        hintText: 'Email',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_controller.text.isEmpty) {
                        return;
                      }
                      if (emailValid) {
                        setState(() {
                          enabled = false;
                        });
                        firestore
                            .saveEmail(_controller.text)
                            .then((value) => _submitDialog(context));
                      } else {
                        setState(() {
                          emailValid = false;
                        });
                        _controller.clear();
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 30,
                      ),
                      child: Text(
                        'Send',
                        style: GoogleFonts.lora(
                          fontSize:
                              ScreenConfig.getHeightPercentage(context, 1.8),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black.withOpacity(0.6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
