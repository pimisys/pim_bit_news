//Lista de noticias en formato transformado de los valores retornados por el API
class NewsApiModel {
  String status;
  int totalResults;
  List<News> newsList;

  NewsApiModel(this.status, this.totalResults, this.newsList);

  //Transforma la lista de articulos en Lista de News, transformado cada json del response, el cual se "administra" como un map
  NewsApiModel.fromJson(Map<String, dynamic> map) {
    var listArticles = map['articles'] as List;

    status = map['status'];
    totalResults = map['totalResults'];
    newsList = listArticles.map((json) => News.fromJson(json)).toList();
  }
}

//Tiene cada una de las noticias
class News {
  Source source;
  String urlToImage;
  String title;
  String url;
  String author;
  String publishedAt; //DateTime
  String content;
  String description;

  News(
      {this.source,
      this.urlToImage,
      this.title,
      this.url,
      this.author,
      this.publishedAt,
      this.content,
      this.description});

  //transforma un json en una News
  News.fromJson(Map<String, dynamic> map) {
    source = Source.fromJson(map['source']);
    urlToImage = map['urlToImage'];
    title = map['title'];
    url = map['url'];
    author = map['author'];
    publishedAt = map['publishedAt'];
    content = map['content'];
    description = map['description'];
  }
}

//Source de las noticias
class Source {
  String id;
  String name;

  Source({this.id, this.name});
  //transforma un jason a un Source
  Source.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
  }
}
