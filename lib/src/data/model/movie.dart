import 'package:freezed_annotation/freezed_annotation.dart';
import 'data_model.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class Movie with _$Movie, DataModel {
  const factory Movie({
    @JsonKey(name: 'id') final int? id,
    @JsonKey(name: 'adult') final bool? isAdult,
    @JsonKey(name: 'backdrop_path') final String? backdropPath,
    @JsonKey(name: 'genre_ids') final List<int>? genreIds,
    @JsonKey(name: 'original_language') final String? language,
    @JsonKey(name: 'title') final String? title,
    @JsonKey(name: 'overview') final String? overview,
    @JsonKey(name: 'popularity') final double? popularity,
    @JsonKey(name: 'poster_path') final String? posterPath,
    @JsonKey(name: 'release_date') final String? releaseDate,
    @JsonKey(name: 'vote_average') final double? voteAvg,
    @JsonKey(name: 'vote_count') final int? voteCount,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
