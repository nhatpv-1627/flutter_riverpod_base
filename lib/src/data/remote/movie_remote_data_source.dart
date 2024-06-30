import 'package:flutter_base/src/data/base/data_source.dart';
import 'package:flutter_base/src/data/model/movie.dart';
import 'package:flutter_base/src/data/remote/api/unauth_api.dart';

import 'api/auth_api.dart';

class MovieRemoteDataSource with DataSource {
  final AuthApi authApi;
  final UnAuthApi unAuthApi;
  final String apiKey;

  MovieRemoteDataSource(
      {required this.authApi, required this.apiKey, required this.unAuthApi});

  Future<List<Movie>?> getTopRatedMovies(int page) async {
    final response = await excuse(() async {
      return await unAuthApi.getTopRatedMovies(apiKey, page);
    });
    return response?.results?.toList();
  }
}
