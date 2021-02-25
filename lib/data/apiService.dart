import 'package:app1/models/news.dart';
import 'package:app1/util/constants_bit_news.dart';
import 'package:app1/util/constants_html.dart';
import 'package:app1/util/dates.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService {
  String urlForApi(var optionUrl) {
    final String apiKey = 'apiKey=163b8cc5d28e421da5ebac7cd090b53b';
    var dateReference = PimDates(dateTime: DateTime.now());
    String url;

    switch (optionUrl) {
      //All articles about Tesla from the last month, sorted by recent first
      case NewsOptionUrl.allArticlesAboutTesla:
        dateReference.addMonths(-1);
        url =
            'https://newsapi.org/v2/everything?q=tesla&from=${dateReference.toStringAAAAMMDD()}&sortBy=publishedAt&$apiKey';
        break;
      //Top business headlines in the US right now
      case NewsOptionUrl.topBussinessUS:
        url =
            'https://newsapi.org/v2/top-headlines?country=us&category=business&$apiKey';
        break;
      //All articles mentioning Apple from yesterday, sorted by popular publishers first
      case NewsOptionUrl.allArticlesAboutAppleYesterday:
        dateReference.addDays(-1);
        url =
            'https://newsapi.org/v2/everything?q=apple&from=${dateReference.toStringAAAAMMDD()}&to=${dateReference.toStringAAAAMMDD()}&sortBy=popularity&$apiKey';
        break;
      //Top headlines from TechCrunch right now
      case NewsOptionUrl.topHeadlinseTechCrunch:
        url = 'https://newsapi.org/v2/top-headlines?sources=techcrunch&$apiKey';
        break;
      //All articles published by the Wall Street Journal in the last 6 months, sorted by recent first
      case NewsOptionUrl.allArticlesWallStreetJournal6Months:
        url = 'https://newsapi.org/v2/everything?domains=wsj.com&$apiKey';
        break;
      default:
        url = '';
        break;
    }
    return url;
  }

  getDio({@required var optionUrl}) async {
    var dio = Dio();

    Response response = await dio.get(urlForApi(optionUrl));

    if (response.statusCode == HttpResponse.httpResponseOK) {
      return NewsApiModel.fromJson(response.data);
    } else {
      print('Algo ha salido mal :(');
    }
  }
}
