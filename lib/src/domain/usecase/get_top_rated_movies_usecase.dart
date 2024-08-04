import 'package:flutter_base/src/domain/models/list_model.dart';
import 'package:flutter_base/src/domain/models/movie_model.dart';
import 'package:flutter_base/src/domain/repository/movie_repository.dart';
import 'package:flutter_base/src/domain/usecase/base/base_input.dart';
import 'package:flutter_base/src/domain/usecase/base/usecase.dart';

class GetTopRatedMoviesUseCase
    extends UseCase<GetTopRatedInput, ListModel<MovieModel>?> {
  final MovieRepository _repository;

  GetTopRatedMoviesUseCase(this._repository);

  @override
  Future<ListModel<MovieModel>?> buildUseCase(GetTopRatedInput input) async {
    return await _repository.getTopRatedMovies(input.page);
  }
}

class GetTopRatedInput implements BaseInput {
  final int page;

  GetTopRatedInput(this.page);
}
