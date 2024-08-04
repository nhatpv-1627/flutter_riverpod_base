import 'package:flutter_base/src/domain/models/movie_detail_model.dart';
import 'package:flutter_base/src/domain/repository/movie_repository.dart';
import 'package:flutter_base/src/domain/usecase/base/base_input.dart';
import 'package:flutter_base/src/domain/usecase/base/usecase.dart';

class GetMovieDetailUsecase
    extends UseCase<GetMovieDetailInput, MovieDetailModel> {
  final MovieRepository _repository;

  GetMovieDetailUsecase(this._repository);

  @override
  Future<MovieDetailModel> buildUseCase(GetMovieDetailInput input) async {
    return await _repository.getMovieDetail(input.movieId);
  }
}

class GetMovieDetailInput implements BaseInput {
  final int movieId;

  GetMovieDetailInput(this.movieId);
}
