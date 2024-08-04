import 'package:dio/dio.dart';
import 'package:flutter_base/src/data/model/login_token.dart';
import 'package:flutter_base/src/data/model/movie.dart';
import 'package:flutter_base/src/data/model/movie_detail.dart';
import 'package:flutter_base/src/data/remote/requests/refresh_token_request.dart';
import 'package:flutter_base/src/data/remote/response/list_response.dart';
import 'package:retrofit/http.dart';

part 'unauth_api.g.dart';

@RestApi()
abstract class UnAuthApi {
  factory UnAuthApi(Dio dio) = _UnAuthApi;

  @POST('/refresh_token')
  Future<Token> refreshToken(@Body() RefreshTokenRequest request);

  @GET('/movie/top_rated')
  Future<ListResponse<Movie>?> getTopRatedMovies(
    @Query('api_key') String apiKey,
    @Query('page') int page,
  );

  @GET('/search/movie')
  Future<ListResponse<Movie>?> searchMovies(
    @Query('api_key') String apiKey,
    @Query('page') int page,
    @Query('query') String? query,
  );

  @GET('/movie/now_playing')
  Future<ListResponse<Movie>?> getNowPlayingMovies(
    @Query('api_key') String apiKey,
    @Query('page') int page,
  );

  @GET('/movie/{movieId}')
  Future<MovieDetail> getMovieDetail(
    @Path('movieId') int movieId,
    @Query('api_key') String apiKey,
  );

  @GET('/movie/popular')
  Future<ListResponse<Movie>?> getPopularMovies(
    @Query('api_key') String apiKey,
    @Query('page') int page,
  );
}
