import 'package:flutter_base/src/domain/models/movie_model.dart';
import 'package:flutter_base/src/domain/repository/movie_repository.dart';
import 'package:flutter_base/src/domain/usecase/base/base_input.dart';
import 'package:flutter_base/src/domain/usecase/base/usecase.dart';

class GetTopRatedMoviesUseCase
    extends UseCase<GetTopRaredInput, List<MovieModel>?> {
  final MovieRepository _repository;

  GetTopRatedMoviesUseCase(this._repository);

  @override
  Future<List<MovieModel>?> buildUseCase(GetTopRaredInput input) async {
    return await _repository.getTopRatedMovies(input.page);
  }
}

class GetTopRaredInput implements BaseInput {
  final int page;

  GetTopRaredInput(this.page);
}
