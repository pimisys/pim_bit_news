import 'package:flutter/material.dart';
import 'package:pim_bit_news/presenter/build_view.dart';
import 'package:pim_bit_news/util/constants_bit_news.dart';
import 'package:pim_bit_news/util/firebaseController.dart'
    as firebaseController;
import 'package:pim_bit_news/view/widgets/common_dialogs.dart';
import 'package:pim_bit_news/view/widgets/drawer_option.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  var intNews = NewsOptionUrl.allArticlesAboutTesla;
  String viewName = 'NewsList';

  static const drawerOptions = <Map<String, dynamic>>[
    {
      'value': NewsOptionUrl.allArticlesAboutTesla,
      'text':
          'All articles about Tesla from the last month, sorted by recent first'
    },
    {
      'value': NewsOptionUrl.topBussinessUS,
      'text': 'Top business headlines in the US right now'
    },
    {
      'value': NewsOptionUrl.allArticlesAboutAppleYesterday,
      'text':
          'All articles mentioning Apple from yesterday, sorted by popular publishers first'
    },
    {
      'value': NewsOptionUrl.topHeadlinseTechCrunch,
      'text': 'Top headlines from TechCrunch right now'
    },
    {
      'value': NewsOptionUrl.allArticlesWallStreetJournal6Months,
      'text':
          'All articles published by the Wall Street Journal in the last 6 months, sorted by recent first'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
        title: Text(
          'BIT News',
          style: TextStyle(color: Colors.black26),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.favorite),
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: CircleAvatar(
                radius: 70,
                backgroundColor: Colors.white,
                child: Image.network(
                    'https://bit.institute/images/Instituto-Cursos-Programacion.png'),
              ),
            ),
            //..  operator?
            //... spreed operator? coje el array y lo toma objeto x objeto
            ...drawerOptions
                .map((option) => DrawerOption(
                      text: option['text'],
                      onTap: () {
                        setState(() {
                          intNews = option['value'];
                          Navigator.pop(context); //cerrar el Navigator
                        });
                      },
                    ))
                .toList(),
            Divider(),
            ListTile(
              title: Text('Settings',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Divider(),
            ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  //barrierDismissible: false,
                  builder: (_) => PimAlertDialogBoxYN(
                      //title: 'Confirmation',
                      question: 'Are you sure to do sing out?',
                      onPressedY: () {
                        firebaseController.signOut(context, loginOption);
                      }),
                );
              },
              title: Text('Sign Out',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(right: 10, left: 10),
        child: BuildView(viewName: viewName, intNews: intNews),
      ),
    );
  }
}

/*      ListView(
        children: NewsRepository()
            .NEWS
            .map((news) => NewsCard(
          news: news,
        ))
            .toList(),
      ),
*/
