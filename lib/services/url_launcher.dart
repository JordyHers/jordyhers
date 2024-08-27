import 'dart:html';

import 'package:url_launcher/url_launcher.dart' as s;

class WebService {
  void launchURL(String url) async {
    if (await s.canLaunch(url)) {
      await s.launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void downloadFile(String url) {
    AnchorElement anchorElement = AnchorElement(href: url);
    anchorElement.download = url;
    anchorElement.click();
  }
}
