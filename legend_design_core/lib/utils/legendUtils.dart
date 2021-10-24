import 'package:url_launcher/url_launcher.dart';

class LegendUtils {
  static Future<void> launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  static String capitalite(String s) {
    String first = s[0].toUpperCase();
    s = s.replaceRange(0, 1, first);
    return s;
  }
}
