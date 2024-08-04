import 'package:flutter_base/src/domain/models/movie_model.dart';
import 'package:flutter_base/src/presentation/base/process.dart';

class HomeState {
  ProcessStatus status = ProcessStatus.loading;
  List<MovieModel>? banners;
  List<MovieModel>? popularMovies;
  List<MovieModel>? topRatedMovies;
  Object? error;

  HomeState(
      {this.status = ProcessStatus.loading,
      this.banners,
      this.popularMovies,
      this.topRatedMovies,
      this.error,
      top});

  HomeState copyWith({
    ProcessStatus? status,
    List<MovieModel>? banners,
    List<MovieModel>? popularMovies,
    List<MovieModel>? topRatedMovies,
    int? nextPage,
    Object? error,
  }) {
    return HomeState(
      status: status ?? this.status,
      banners: banners ?? this.banners,
      popularMovies: popularMovies ?? this.popularMovies,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      error: error ?? this.error,
    );
  }
}
