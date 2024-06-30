import 'package:flutter_base/src/domain/models/movie_model.dart';

abstract class MovieRepository {
  Future<List<MovieModel>?> getTopRatedMovies(int page);
}
