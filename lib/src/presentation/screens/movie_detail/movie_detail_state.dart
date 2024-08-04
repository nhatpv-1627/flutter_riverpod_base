import 'package:flutter_base/src/domain/models/movie_detail_model.dart';
import 'package:flutter_base/src/presentation/base/process.dart';

class MovieDetailState {
  ProcessStatus status = ProcessStatus.loading;
  MovieDetailModel? movie;
  String? query;
  Object? error;

  MovieDetailState(
      {this.status = ProcessStatus.loading,
      this.movie,
      this.error,
      this.query,
      top});

  MovieDetailState copyWith({
    ProcessStatus? status,
    MovieDetailModel? movie,
    Object? error,
  }) {
    return MovieDetailState(
      status: status ?? this.status,
      movie: movie ?? this.movie,
      error: error ?? this.error,
    );
  }
}
