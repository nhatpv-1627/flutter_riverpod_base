import 'package:flutter_base/src/data/model/movie.dart';

class ListResponse<T> {
  List<Movie>? results;
  int? page;
  int? totalPage;
  int? totalResults;

  ListResponse({this.results, this.page, this.totalPage, this.totalResults});

  factory ListResponse.fromJson(Map<String, dynamic> json) {
    return ListResponse(
      results:
          json['results'] != null ? (json['results'] as List<dynamic>).map((e) => Movie.fromJson(e)).toList() : null,
      page: json['page'],
      totalPage: json['total_pages'],
      totalResults: json['total_results'],
    );
  }

  Map<String, dynamic> toJson() => {
        'results': results,
        'page': page,
        'total_pages': totalPage,
        'total_results': totalResults,
      };
}
