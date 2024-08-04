import 'package:flutter_base/src/domain/models/movie_model.dart';
import 'package:flutter_base/src/presentation/base/process.dart';

class SearchMoviesState {
  ProcessStatus status = ProcessStatus.loading;
  List<MovieModel>? movies;
  String? query;
  int? nextPage = 1;
  Object? error;

  SearchMoviesState(
      {this.status = ProcessStatus.loading,
      this.movies,
      this.nextPage,
      this.error,
      this.query,
      top});

  SearchMoviesState copyWith({
    ProcessStatus? status,
    List<MovieModel>? movies,
    int? nextPage,
    String? query,
    Object? error,
  }) {
    return SearchMoviesState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      nextPage: nextPage ?? this.nextPage,
      error: error ?? this.error,
      query: query ?? this.query,
    );
  }
}
