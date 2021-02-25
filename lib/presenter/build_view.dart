import 'package:app1/data/apiService.dart';
import 'package:app1/presenter/news_card_from_snapshot.dart';
import 'package:app1/util/styles.dart';
import 'package:app1/view/widgets/dialog_button.dart';
//import 'package:app1/presenter/news_card.dart';
import 'package:flutter/material.dart';

class BuildView extends StatelessWidget {
  final String viewName;
  final intNews;

  BuildView({@required this.viewName, @required this.intNews});

  @override
  Widget build(BuildContext context) {
    switch (viewName) {
      case 'NewsList':
        return Container(
          child: Center(
            child: Container(
              child: FutureBuilder(
                  future: ApiService().getDio(optionUrl: intNews),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: (snapshot.data).newsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          //return NewsCard(
                          //    news: (snapshot.data).newsList[index]);
                          return NewsCardFromSnapshot(
                            snapshotData: (snapshot.data).newsList[index],
                            onTapFav: (news) {
                              //print(news.title);
                              showDialog(
                                  context: context,
                                  //barrierDismissible: false,
                                  builder: (_) => PimAlertDialogBoxYN(
                                      //title: 'Confirmation',
                                      question:
                                          'Are you sure to dd this news to favorite list?',
                                      onPressedY: () {}));
                            },
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Container(
                        child:
                            PimLabel(caption: 'Paila... No hay datos... ;-('),
                      ); //pagina de error
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
          ),
        );
      case 'FavoriteList':
        return Container();
    }
  }
}
