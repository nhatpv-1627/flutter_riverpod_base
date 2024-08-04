import 'package:flutter_base/src/domain/models/list_model.dart';
import 'package:flutter_base/src/domain/models/movie_detail_model.dart';
import 'package:flutter_base/src/domain/models/movie_model.dart';

abstract class MovieRepository {
  Future<ListModel<MovieModel>> getTopRatedMovies(int page);

  Future<ListModel<MovieModel>> getPopularMovies(int page);

  Future<ListModel<MovieModel>> getNowPlayingMovies(int page);

  Future<ListModel<MovieModel>> searchMovies(int page, String? query);

  Future<MovieDetailModel> getMovieDetail(int movieId);
}
