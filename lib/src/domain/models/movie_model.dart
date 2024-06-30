import 'package:flutter_base/src/domain/models/domain_model.dart';

class MovieModel extends DomainModel {
  final int id;
  final bool isAdult;
  final String backdropPath;
  final List<int> genreIds;
  final String language;
  final String title;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final double voteAvg;
  final int voteCount;

  MovieModel({
    required this.id,
    required this.isAdult,
    required this.backdropPath,
    required this.genreIds,
    required this.language,
    required this.title,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAvg,
    required this.voteCount,
  });

  @override
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
