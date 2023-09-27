// To parse this JSON data, do
//
//     final moviesModel = moviesModelFromJson(jsonString);

import 'dart:convert';

MoviesModel moviesModelFromJson(String str) =>
    MoviesModel.fromJson(json.decode(str));

class MoviesModel {
  int id;
  String title;
  String language;
  DateTime releaseDate;
  List<Detail> details;
  List<dynamic> tags;
  List<Video> videos;
  List<Image> images;
  List<Collection> collections;
  int watches;
  int duration;
  int activeScreens;
  VoteScore voteScore;
  FavMovie favMovie;
  int stars;
  List<dynamic> ratings;
  List<Feeder> feeders;

  MoviesModel({
    required this.id,
    required this.title,
    required this.language,
    required this.releaseDate,
    required this.details,
    required this.tags,
    required this.videos,
    required this.images,
    required this.collections,
    required this.watches,
    required this.duration,
    required this.activeScreens,
    required this.voteScore,
    required this.favMovie,
    required this.stars,
    required this.ratings,
    required this.feeders,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
        id: json["id"] ?? 0,
        title: json["title"] ?? "",
        language: json["language"] ?? "",
        releaseDate: json["release_date"] != null
            ? DateTime.parse(json["release_date"])
            : DateTime.now(),
        details: json["details"] != null
            ? List<Detail>.from(json["details"].map((x) => Detail.fromJson(x)))
            : [],
        tags: json["tags"] != null
            ? List<dynamic>.from(json["tags"].map((x) => x))
            : [],
        videos: json["videos"] != null
            ? List<Video>.from(json["videos"].map((x) => Video.fromJson(x)))
            : [],
        images: json["images"] != null
            ? List<Image>.from(json["images"].map((x) => Image.fromJson(x)))
            : [],
        collections: json["collections"] != null
            ? List<Collection>.from(
                json["collections"].map((x) => Collection.fromJson(x)))
            : [],
        watches: json["watches"] ?? 0,
        duration: json["duration"] ?? 0,
        activeScreens: json["active_screens"] ?? 0,
        voteScore: json["vote_score"] != null
            ? VoteScore.fromJson(json["vote_score"])
            : VoteScore.fromJson({}),
        favMovie: json["fav_movie"] != null
            ? FavMovie.fromJson(json["fav_movie"])
            : FavMovie.fromJson({}),
        stars: json["stars"] ?? 0,
        ratings: json["ratings"] != null
            ? List<dynamic>.from(json["ratings"].map((x) => x))
            : [],
        feeders: json["feeders"] != null
            ? List<Feeder>.from(json["feeders"].map((x) => Feeder.fromJson(x)))
            : [],
      );

       static List<MoviesModel> jsonToList(List<dynamic> emote) =>
      emote.map<MoviesModel>((item) => MoviesModel.fromJson(item)).toList();
}

class Collection {
  int id;
  String name;
  String slug;
  List<int> movies;

  Collection({
    required this.id,
    required this.name,
    required this.slug,
    required this.movies,
  });

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        slug: json["slug"] ?? "",
        movies: json["movies"] != null
            ? List<int>.from(json["movies"].map((x) => x))
            : [],
      );
}

class Detail {
  int id;
  String language;
  String title;
  String director;
  String tagline;
  String cast;
  String storyline;

  Detail({
    required this.id,
    required this.language,
    required this.title,
    required this.director,
    required this.tagline,
    required this.cast,
    required this.storyline,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        id: json["id"] ?? 0,
        language: json["language"] ?? "",
        title: json["title"] ?? "",
        director: json["director"] ?? "",
        tagline: json["tagline"] ?? "",
        cast: json["cast"] ?? "",
        storyline: json["storyline"] ?? "",
      );
}

class FavMovie {
  bool star;
  bool follow;
  bool watched;

  FavMovie({
    required this.star,
    required this.follow,
    required this.watched,
  });

  factory FavMovie.fromJson(Map<String, dynamic> json) => FavMovie(
        star: json["star"] ?? false,
        follow: json["follow"] ?? false,
        watched: json["watched"] ?? false,
      );
}

class Feeder {
  String name;
  String url;

  Feeder({
    required this.name,
    required this.url,
  });

  factory Feeder.fromJson(Map<String, dynamic> json) => Feeder(
        name: json["name"] ?? "",
        url: json["url"] ?? "",
      );
}

class Image {
  int id;
  int order;
  String url;
  String type;
  String thumbnail;

  Image({
    required this.id,
    required this.order,
    required this.url,
    required this.type,
    required this.thumbnail,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"] ?? 0,
        order: json["order"] ?? 0,
        url: json["url"] ?? "",
        type: json["type"] ?? "",
        thumbnail: json["thumbnail"] ?? "",
      );
}

class Video {
  String url;
  String source;
  String kind;
  String language;

  Video({
    required this.url,
    required this.source,
    required this.kind,
    required this.language,
  });

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        url: json["url"] ?? "",
        source: json["source"] ?? "",
        kind: json["kind"] ?? "",
        language: json["language"] ?? "",
      );
}

class VoteScore {
  int avg;
  int score;
  int total;

  VoteScore({
    required this.avg,
    required this.score,
    required this.total,
  });

  factory VoteScore.fromJson(Map<String, dynamic> json) => VoteScore(
        avg: json["avg"] ?? 0,
        score: json["score"] ?? 0,
        total: json["total"] ?? 0,
      );
}
