import 'package:flutter_base/src/domain/models/list_model.dart';
import 'package:flutter_base/src/domain/models/movie_model.dart';
import 'package:flutter_base/src/domain/repository/movie_repository.dart';
import 'package:flutter_base/src/domain/usecase/base/base_input.dart';
import 'package:flutter_base/src/domain/usecase/base/usecase.dart';

class GetNowPlayingMoviesUseCase
    extends UseCase<GetNowPlayingInput, ListModel<MovieModel>?> {
  final MovieRepository _repository;

  GetNowPlayingMoviesUseCase(this._repository);

  @override
  Future<ListModel<MovieModel>?> buildUseCase(GetNowPlayingInput input) async {
    return await _repository.getNowPlayingMovies(input.page);
  }
}

class GetNowPlayingInput implements BaseInput {
  final int page;

  GetNowPlayingInput(this.page);
}
