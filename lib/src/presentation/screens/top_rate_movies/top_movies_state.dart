import 'package:flutter_base/src/domain/models/movie_model.dart';
import 'package:flutter_base/src/presentation/base/process.dart';

class TopMoviesState {
  ProcessStatus status = ProcessStatus.loading;
  List<MovieModel>? movies;
  int? currentPage = 1;
  Object? error;

  TopMoviesState({
    this.status = ProcessStatus.loading,
    this.movies,
    this.currentPage,
    this.error,
  });

  TopMoviesState copyWith({
    ProcessStatus? status,
    List<MovieModel>? movies,
    int? currentPage,
    Object? error,
  }) {
    return TopMoviesState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      currentPage: currentPage ?? this.currentPage,
      error: error ?? this.error,
    );
  }
}
