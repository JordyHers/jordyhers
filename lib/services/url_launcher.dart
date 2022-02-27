import 'dart:html';
import 'package:url_launcher/url_launcher.dart';

class WebService {
  Future<void> launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Can't launch ";
    }
  }

  void downloadFile(String url) {
    AnchorElement anchorElement = AnchorElement(href: url);
    anchorElement.download = url;
    anchorElement.click();
  }
}
