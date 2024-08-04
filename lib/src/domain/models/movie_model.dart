import 'package:flutter_base/src/domain/models/domain_model.dart';

class MovieModel extends DomainModel {
  final int id;
  final bool? isAdult;
  final String? backdropPath;
  final List<int>? genreIds;
  final String? language;
  final String? title;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final double? voteAvg;
  final int? voteCount;

  MovieModel({
    required this.id,
    this.isAdult,
    this.backdropPath,
    this.genreIds,
    this.language,
    this.title,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.voteAvg,
    this.voteCount,
  });

  List<Object?> get props => [
        id,
        isAdult,
        backdropPath,
        genreIds,
        language,
        title,
        overview,
        popularity,
        posterPath,
        releaseDate,
        voteAvg,
        voteCount
      ];
}
