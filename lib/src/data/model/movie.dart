// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

import 'data_model.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie with DataModel {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'adult')
  final bool? isAdult;

  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  @JsonKey(name: 'genre_ids')
  final List<int>? genreIds;

  @JsonKey(name: 'original_language')
  final String? language;

  @JsonKey(name: 'title')
  final String? title;

  @JsonKey(name: 'overview')
  final String? overview;

  @JsonKey(name: 'popularity')
  final double? popularity;

  @JsonKey(name: 'poster_path')
  final String? posterPath;

  @JsonKey(name: 'release_date')
  final String? releaseDate;

  @JsonKey(name: 'vote_average')
  final double? voteAvg;

  @JsonKey(name: 'vote_count')
  final int? voteCount;
  Movie({
    this.id,
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

  Movie copyWith({
    int? id,
    bool? isAdult,
    String? backdropPath,
    List<int>? genreIds,
    String? language,
    String? title,
    String? overview,
    double? popularity,
    String? posterPath,
    String? releaseDate,
    double? voteAvg,
    int? voteCount,
  }) {
    return Movie(
      id: id ?? this.id,
      isAdult: isAdult ?? this.isAdult,
      backdropPath: backdropPath ?? this.backdropPath,
      genreIds: genreIds ?? this.genreIds,
      language: language ?? this.language,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      releaseDate: releaseDate ?? this.releaseDate,
      voteAvg: voteAvg ?? this.voteAvg,
      voteCount: voteCount ?? this.voteCount,
    );
  }

  Map<String, dynamic> toJson() => _$MovieToJson(this);

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  @override
  String toString() {
    return 'Movie(id: $id, isAdult: $isAdult, backdropPath: $backdropPath, genreIds: $genreIds, language: $language, title: $title, overview: $overview, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, voteAvg: $voteAvg, voteCount: $voteCount)';
  }
}
