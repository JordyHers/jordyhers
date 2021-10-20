import 'package:url_launcher/url_launcher.dart';

class Http {
  Future<void> launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Can't launch ";
    }
  }
}
