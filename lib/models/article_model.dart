class ArticleModel {
  String? status;
  int? totalResults;
  List<Articles>? articles;

  ArticleModel({
    this.status,
    this.totalResults,
    this.articles,});

  ArticleModel.fromJson(dynamic json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(Articles.fromJson(v));
      });
    }
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['totalResults'] = totalResults;
    if (articles != null) {
      map['articles'] = articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// source : {"id":"bbc-news","name":"BBC News"}
/// author : "Jack Silver"
/// title : "Jersey picks DFDS to run passenger and freight ferry services"
/// description : "The decision puts Jersey at odds with Guernsey, which has chosen Brittany Ferries."
/// url : "https://www.bbc.co.uk/news/articles/c1mln7kr3lgo"
/// urlToImage : "https://ichef.bbci.co.uk/news/1024/branded_news/3bbc/live/5d94a830-986f-11ef-9a64-e3368355d750.jpg"
/// publishedAt : "2024-12-03T19:58:16Z"
/// content : "Confirmation that Jersey has picked the Danish ferry firm followed concerns from a tourism group it would be \"unworkable\" for two separate companies to serve the Channel Islands.\r\nSimon de la Rue, fr… [+527 chars]"

class Articles {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Articles({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,});

  Articles.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

}

/// id : "bbc-news"
/// name : "BBC News"

class Source {
  String? id;
  String? name;

  Source({
    this.id,
    this.name,});

  Source.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}// TODO Implement this library.