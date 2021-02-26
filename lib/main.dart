import 'package:flutter/material.dart';
import 'package:pim_bit_news/util/constants_bit_news.dart';
import 'package:pim_bit_news/util/firebaseController.dart' as firebaseAuth;
import 'package:pim_bit_news/view/login_page.dart';
import 'package:pim_bit_news/view/news_page.dart';
import 'package:pim_bit_news/view/singUp.dart';

import 'file:///D:/Users/PIMIENTO/AndroidStudioProjects/pim_bit_news/lib/view/news_card_open.dart';

void main() {
  runApp(MyApp());
  firebaseAuth.Initializing();
}

// clase principal
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _currentOption = '';

  @override
  Widget build(BuildContext context) {
    var page;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: loginOption,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case loginOption:
            page = MaterialPageRoute(builder: (context) => new LoginPage());
            break;
          case newsOption:
            page = MaterialPageRoute(builder: (context) => new NewsPage());
            break;
          case newsOpenOption:
            page = MaterialPageRoute(
              builder: (context) => new NewsCardOpen(news: settings.arguments),
            );
            break;
          case singUpOption:
            page = MaterialPageRoute(builder: (context) => new RegisterUser());
            // MaterialPageRoute(builder: (context) {new NewsCardOpen(news: news);
            break;
          case '/':
            if (_currentOption == '') {
              page = null;
            } else if (_currentOption != '/') {
              Navigator.pushNamed(context, _currentOption);
              return null;
            } else {
              Navigator.pushNamed(context, loginOption);
              return null;
            } //al iniciar?
            break;
          default:
            page = null;
        }
        _currentOption = settings.name;
        return page;
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
