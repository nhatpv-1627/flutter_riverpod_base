import 'package:flutter_base/src/data/mapper/movie_mapper.dart';
import 'package:flutter_base/src/data/remote/movie_remote_data_source.dart';
import 'package:flutter_base/src/domain/models/movie_model.dart';
import 'package:flutter_base/src/domain/repository/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource _movieRemoteDataSource;
  final MovieMapper _movieMapper;

  MovieRepositoryImpl(this._movieRemoteDataSource, this._movieMapper);

  @override
  Future<List<MovieModel>?> getTopRatedMovies(int page) async {
    final movies = await _movieRemoteDataSource.getTopRatedMovies(page);
    return _movieMapper.mapNullableList(movies);
  }
}
