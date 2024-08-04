import 'package:flutter_base/src/domain/models/list_model.dart';
import 'package:flutter_base/src/domain/models/movie_model.dart';
import 'package:flutter_base/src/domain/repository/movie_repository.dart';
import 'package:flutter_base/src/domain/usecase/base/base_input.dart';
import 'package:flutter_base/src/domain/usecase/base/usecase.dart';

class GetPopularMoviesUseCase
    extends UseCase<GetPopularInput, ListModel<MovieModel>?> {
  final MovieRepository _repository;

  GetPopularMoviesUseCase(this._repository);

  @override
  Future<ListModel<MovieModel>?> buildUseCase(GetPopularInput input) async {
    return await _repository.getPopularMovies(input.page);
  }
}

class GetPopularInput implements BaseInput {
  final int page;

  GetPopularInput(this.page);
}
