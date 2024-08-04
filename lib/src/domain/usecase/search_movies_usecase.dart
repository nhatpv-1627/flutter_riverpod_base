import 'package:flutter_base/src/domain/models/list_model.dart';
import 'package:flutter_base/src/domain/models/movie_model.dart';
import 'package:flutter_base/src/domain/repository/movie_repository.dart';
import 'package:flutter_base/src/domain/usecase/base/base_input.dart';
import 'package:flutter_base/src/domain/usecase/base/usecase.dart';

class SearchMoviesUseCase
    extends UseCase<SearchMoviesInput, ListModel<MovieModel>?> {
  final MovieRepository _repository;

  SearchMoviesUseCase(this._repository);

  @override
  Future<ListModel<MovieModel>?> buildUseCase(SearchMoviesInput input) async {
    return await _repository.searchMovies(input.page, input.query);
  }
}

class SearchMoviesInput implements BaseInput {
  final int page;
  final String? query;

  SearchMoviesInput(this.page, this.query);
}
