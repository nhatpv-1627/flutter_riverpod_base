import 'package:flutter_base/src/domain/models/movie_model.dart';
import 'package:flutter_base/src/domain/usecase/base/observer.dart';
import 'package:flutter_base/src/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:flutter_base/src/presentation/base/base_viewmodel.dart';
import 'package:flutter_base/src/presentation/base/process_state.dart';

class TopRatedMoviesViewModel extends BaseViewModel {
  TopRatedMoviesViewModel(this._getTopRatedMoviesUseCase) {
    processes.add(movieListState);
  }

  final GetTopRatedMoviesUseCase _getTopRatedMoviesUseCase;

  final movieListState = ProcessState<List<MovieModel>?>();
  int currentPage = 1;

  void getTopRatedMovies() async {
    final input = GetTopRaredInput(currentPage);
    await _getTopRatedMoviesUseCase.call(
        input,
        BaseObserver()
          ..onSubscribe(() {
            movieListState.onLoading();
          })
          ..onSuccess((data) {
            movieListState.onSuccess(data);
          })
          ..onError((error) {
            movieListState.onError(error);
          }));
    notifyListeners();
  }
}
