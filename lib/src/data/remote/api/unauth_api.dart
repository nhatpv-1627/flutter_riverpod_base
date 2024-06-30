import 'package:dio/dio.dart';
import 'package:flutter_base/src/data/model/login_token.dart';
import 'package:flutter_base/src/data/model/movie.dart';
import 'package:flutter_base/src/data/remote/response/list_response.dart';
import 'package:retrofit/http.dart';

part 'unauth_api.g.dart';

@RestApi()
abstract class UnAuthApi {
  factory UnAuthApi(Dio dio) = _UnauthApi;

  @POST('/refresh_token')
  Future<Token> refreshToken();

  @GET('/movie/top_rated')
  Future<ListResponse<Movie>?> getTopRatedMovies(
    @Query('api_key') String apiKey,
    @Query('page') int page,
  );
}
