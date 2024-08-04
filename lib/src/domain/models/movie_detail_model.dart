import 'package:flutter_base/src/domain/models/domain_model.dart';

class MovieDetailModel extends DomainModel {
  MovieDetailModel({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    required this.id,
    this.imdbId,
    this.originCountry,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });
  final bool? adult;
  final String? backdropPath;
  final CollectionModel? belongsToCollection;
  final int? budget;
  final List<GenreModel>? genres;
  final String? homepage;
  final int id;
  final String? imdbId;
  final List<String>? originCountry;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final int? revenue;
  final int? runtime;
  final String? status;
  final String? tagline;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;
}

class CollectionModel extends DomainModel {
  CollectionModel({
    required this.id,
    this.name,
    this.posterPath,
    this.backdropPath,
  });
  final int id;
  final String? name;
  final String? posterPath;
  final String? backdropPath;
}

class GenreModel extends DomainModel {
  GenreModel({
    required this.id,
    this.name,
  });
  final int id;
  final String? name;
}
