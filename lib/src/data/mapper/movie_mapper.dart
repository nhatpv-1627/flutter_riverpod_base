import 'package:flutter_base/config/environment.dart';
import 'package:flutter_base/src/data/mapper/data_mapper.dart';
import 'package:flutter_base/src/data/model/movie.dart';
import 'package:flutter_base/src/domain/models/movie_model.dart';
import 'package:flutter_base/src/shared/const.dart';

class MovieMapper extends DataMapper<Movie, MovieModel> {
  @override
  MovieModel map(Movie? data) {
    return MovieModel(
      id: data?.id ?? invalidId,
      backdropPath: '${Environment.baseAssetLink}${data?.backdropPath}',
      genreIds: data?.genreIds ?? [],
      isAdult: data?.isAdult ?? false,
      language: data?.language ?? empty,
      overview: data?.overview ?? empty,
      popularity: data?.popularity ?? 0.0,
      posterPath: '${Environment.baseAssetLink}${data?.posterPath}',
      releaseDate: data?.releaseDate ?? empty,
      title: data?.title ?? empty,
      voteAvg: data?.voteAvg ?? 0.0,
      voteCount: data?.voteCount ?? 0,
    );
  }
}
