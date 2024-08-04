import 'package:flutter_base/src/data/base/data_source.dart';
import 'package:flutter_base/src/data/model/movie.dart';
import 'package:flutter_base/src/data/model/movie_detail.dart';
import 'package:flutter_base/src/data/remote/api/unauth_api.dart';
import 'package:flutter_base/src/data/remote/response/list_response.dart';

import 'api/auth_api.dart';

class MovieRemoteDataSource with DataSource {
  final AuthApi authApi;
  final UnAuthApi unAuthApi;
  final String apiKey;

  MovieRemoteDataSource(
      {required this.authApi, required this.apiKey, required this.unAuthApi});

  Future<ListResponse<Movie>?> getTopRatedMovies(int page) async {
    final response = await excuse(() async {
      return await unAuthApi.getTopRatedMovies(apiKey, page);
    });
    return response;
  }

  Future<ListResponse<Movie>?> getPopularMovies(int page) async {
    final response = await excuse(() async {
      return await unAuthApi.getPopularMovies(apiKey, page);
    });
    return response;
  }

  Future<ListResponse<Movie>?> getNowPlayingMovies(int page) async {
    final response = await excuse(() async {
      return await unAuthApi.getNowPlayingMovies(apiKey, page);
    });
    return response;
  }

  Future<MovieDetail> getMovieDetail(int movieId) async {
    final response = await excuse(() async {
      return await authApi.getMovieDetail(movieId, apiKey);
    });
    return response;
  }

  Future<ListResponse<Movie>?> searchMovies(int page, String? query) async {
    final response = await excuse(() async {
      return await unAuthApi.searchMovies(apiKey, page, query);
    });
    return response;
  }
}
