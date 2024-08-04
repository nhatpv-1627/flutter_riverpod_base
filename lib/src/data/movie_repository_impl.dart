import 'package:flutter_base/src/data/mapper/movie_detail_mapper.dart';
import 'package:flutter_base/src/data/mapper/movie_mapper.dart';
import 'package:flutter_base/src/data/model/movie.dart';
import 'package:flutter_base/src/data/model/movie_detail.dart';
import 'package:flutter_base/src/data/remote/movie_remote_data_source.dart';
import 'package:flutter_base/src/data/remote/response/list_response.dart';
import 'package:flutter_base/src/domain/models/list_model.dart';
import 'package:flutter_base/src/domain/models/movie_detail_model.dart';
import 'package:flutter_base/src/domain/models/movie_model.dart';
import 'package:flutter_base/src/domain/repository/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource _movieRemoteDataSource;
  final MovieMapper _movieMapper;
  final MovieDetailMapper _movieDetailMapper;

  MovieRepositoryImpl(
      this._movieRemoteDataSource, this._movieMapper, this._movieDetailMapper);

  @override
  Future<ListModel<MovieModel>> getTopRatedMovies(int page) async {
    final ListResponse<Movie>? response =
        await _movieRemoteDataSource.getTopRatedMovies(page);
    return ListModel<MovieModel>(
      results: _movieMapper.mapNullableList(response?.results),
      totalPages: response?.totalPage,
    );
  }

  @override
  Future<ListModel<MovieModel>> getPopularMovies(int page) async {
    final ListResponse<Movie>? response =
        await _movieRemoteDataSource.getPopularMovies(page);
    return ListModel<MovieModel>(
      results: _movieMapper.mapNullableList(response?.results),
      totalPages: response?.totalPage,
    );
  }

  @override
  Future<ListModel<MovieModel>> getNowPlayingMovies(int page) async {
    final ListResponse<Movie>? response =
        await _movieRemoteDataSource.getNowPlayingMovies(page);
    return ListModel<MovieModel>(
      results: _movieMapper.mapNullableList(response?.results),
      totalPages: response?.totalPage,
    );
  }

  @override
  Future<MovieDetailModel> getMovieDetail(int movieId) async {
    final MovieDetail response =
        await _movieRemoteDataSource.getMovieDetail(movieId);
    return _movieDetailMapper.map(response);
  }

  @override
  Future<ListModel<MovieModel>> searchMovies(int page, String? query) async {
    final ListResponse<Movie>? response =
        await _movieRemoteDataSource.searchMovies(page, query);
    return ListModel<MovieModel>(
      results: _movieMapper.mapNullableList(response?.results),
      totalPages: response?.totalPage,
    );
  }
}
