import 'package:app1/util/constants_bit_news.dart';
import 'package:app1/view/login_page.dart';
import 'package:app1/view/news_page.dart';
import 'package:flutter/material.dart';

import 'file:///D:/Users/PIMIENTO/AndroidStudioProjects/pim_bit_news/lib/view/news_card_open.dart';

void main() {
  runApp(MyApp());
}

// clase principal
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: loginOption,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case loginOption:
            return MaterialPageRoute(builder: (context) => new LoginPage());
          case newsOption:
            return MaterialPageRoute(builder: (context) => new NewsPage());
          case newsOpenOption:
            return MaterialPageRoute(
              builder: (context) => new NewsCardOpen(news: settings.arguments),
            );
          case singUpOption:
            return null; // MaterialPageRoute(builder: (context) {new NewsCardOpen(news: news);
          default:
            return null;
        }
      },
    );
  }

  // Route<dynamic> _getRoute(RouteSettings settings) {
  //   return _buildRoute(settings, new NewsCardOpen(news: settings);
  // }
  //
  // MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
  //   return new MaterialPageRoute(
  //     settings: settings,
  //     builder: (ctx) => builder,
  //   );
  // }
}
