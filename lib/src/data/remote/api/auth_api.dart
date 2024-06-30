import 'package:dio/dio.dart';
import 'package:flutter_base/src/data/model/movie.dart';
import 'package:flutter_base/src/data/remote/response/list_response.dart';
import 'package:retrofit/http.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio) = _AuthApi;

  @GET('/movie/top_rated')
  Future<ListResponse<Movie>> getTopRatedMovies(
    @Query('api_key') String apiKey,
    @Query('page') int page,
  );
}
