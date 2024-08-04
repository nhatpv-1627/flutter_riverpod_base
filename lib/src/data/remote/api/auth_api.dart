import 'package:dio/dio.dart';
import 'package:flutter_base/src/data/model/movie_detail.dart';
import 'package:retrofit/http.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio) = _AuthApi;

  @GET('/movie/{movieId}')
  Future<MovieDetail> getMovieDetail(
    @Path('movieId') int movieId,
    @Query('api_key') String apiKey,
  );
}
