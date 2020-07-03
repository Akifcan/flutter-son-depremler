import 'package:url_launcher/url_launcher.dart';

showDetailsOnBrowser(place) async {
  await launch('https://www.google.com.tr/search?query=${place}%20deprem');
}
