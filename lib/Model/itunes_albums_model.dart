// To parse this JSON data, do
//
//     final albums = albumsFromJson(jsonString);

import 'dart:convert';

Albums albumsFromJson(String str) => Albums.fromJson(json.decode(str));

String albumsToJson(Albums data) => json.encode(data.toJson());

class Albums {
  Feed feed;

  Albums({
    this.feed,
  });

  factory Albums.fromJson(Map<String, dynamic> json) => new Albums(
    feed: json["feed"] == null ? null : Feed.fromJson(json["feed"]),
  );

  Map<String, dynamic> toJson() => {
    "feed": feed == null ? null : feed.toJson(),
  };
}

class Feed {
  String title;
  String id;
  Author author;
  List<Link> links;
  String copyright;
  String country;
  String icon;
  DateTime updated;
  List<Result> results;

  Feed({
    this.title,
    this.id,
    this.author,
    this.links,
    this.copyright,
    this.country,
    this.icon,
    this.updated,
    this.results,
  });

  factory Feed.fromJson(Map<String, dynamic> json) => new Feed(
    title: json["title"] == null ? null : json["title"],
    id: json["id"] == null ? null : json["id"],
    author: json["author"] == null ? null : Author.fromJson(json["author"]),
    links: json["links"] == null ? null : new List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
    copyright: json["copyright"] == null ? null : json["copyright"],
    country: json["country"] == null ? null : json["country"],
    icon: json["icon"] == null ? null : json["icon"],
    updated: json["updated"] == null ? null : DateTime.parse(json["updated"]),
    results: json["results"] == null ? null : new List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title == null ? null : title,
    "id": id == null ? null : id,
    "author": author == null ? null : author.toJson(),
    "links": links == null ? null : new List<dynamic>.from(links.map((x) => x.toJson())),
    "copyright": copyright == null ? null : copyright,
    "country": country == null ? null : country,
    "icon": icon == null ? null : icon,
    "updated": updated == null ? null : updated.toIso8601String(),
    "results": results == null ? null : new List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Author {
  String name;
  String uri;

  Author({
    this.name,
    this.uri,
  });

  factory Author.fromJson(Map<String, dynamic> json) => new Author(
    name: json["name"] == null ? null : json["name"],
    uri: json["uri"] == null ? null : json["uri"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "uri": uri == null ? null : uri,
  };
}

class Link {
  String self;
  String alternate;

  Link({
    this.self,
    this.alternate,
  });

  factory Link.fromJson(Map<String, dynamic> json) => new Link(
    self: json["self"] == null ? null : json["self"],
    alternate: json["alternate"] == null ? null : json["alternate"],
  );

  Map<String, dynamic> toJson() => {
    "self": self == null ? null : self,
    "alternate": alternate == null ? null : alternate,
  };
}

class Result {
  String artistName;
  String id;
  DateTime releaseDate;
  String name;
  Kind kind;
  String copyright;
  String artistId;
  String artistUrl;
  String artworkUrl100;
  List<Genre> genres;
  String url;

  Result({
    this.artistName,
    this.id,
    this.releaseDate,
    this.name,
    this.kind,
    this.copyright,
    this.artistId,
    this.artistUrl,
    this.artworkUrl100,
    this.genres,
    this.url,
  });

  factory Result.fromJson(Map<String, dynamic> json) => new Result(
    artistName: json["artistName"] == null ? null : json["artistName"],
    id: json["id"] == null ? null : json["id"],
    releaseDate: json["releaseDate"] == null ? null : DateTime.parse(json["releaseDate"]),
    name: json["name"] == null ? null : json["name"],
    kind: json["kind"] == null ? null : kindValues.map[json["kind"]],
    copyright: json["copyright"] == null ? null : json["copyright"],
    artistId: json["artistId"] == null ? null : json["artistId"],
    artistUrl: json["artistUrl"] == null ? null : json["artistUrl"],
    artworkUrl100: json["artworkUrl100"] == null ? null : json["artworkUrl100"],
    genres: json["genres"] == null ? null : new List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
    url: json["url"] == null ? null : json["url"],
  );

  Map<String, dynamic> toJson() => {
    "artistName": artistName == null ? null : artistName,
    "id": id == null ? null : id,
    "releaseDate": releaseDate == null ? null : "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
    "name": name == null ? null : name,
    "kind": kind == null ? null : kindValues.reverse[kind],
    "copyright": copyright == null ? null : copyright,
    "artistId": artistId == null ? null : artistId,
    "artistUrl": artistUrl == null ? null : artistUrl,
    "artworkUrl100": artworkUrl100 == null ? null : artworkUrl100,
    "genres": genres == null ? null : new List<dynamic>.from(genres.map((x) => x.toJson())),
    "url": url == null ? null : url,
  };
}

class Genre {
  String genreId;
  String name;
  String url;

  Genre({
    this.genreId,
    this.name,
    this.url,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => new Genre(
    genreId: json["genreId"] == null ? null : json["genreId"],
    name: json["name"] == null ? null : json["name"],
    url: json["url"] == null ? null : json["url"],
  );

  Map<String, dynamic> toJson() => {
    "genreId": genreId == null ? null : genreId,
    "name": name == null ? null : name,
    "url": url == null ? null : url,
  };
}

enum Kind { IOS_SOFTWARE }

final kindValues = new EnumValues({
  "iosSoftware": Kind.IOS_SOFTWARE
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
