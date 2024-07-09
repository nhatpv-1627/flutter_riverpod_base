// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ListResponse<T> {
  @JsonKey(name: 'results')
  List<T>? results;

  @JsonKey(name: 'page')
  int? page;

  @JsonKey(name: 'total_pages')
  int? totalPage;

  @JsonKey(name: 'total_results')
  int? totalResults;

  ListResponse({this.results, this.page, this.totalPage, this.totalResults});

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$ListResponseToJson(this, toJsonT);

  factory ListResponse.fromJson(Map<String, dynamic> json, fromJsonT) =>
      _$ListResponseFromJson(json, fromJsonT);

  @override
  String toString() {
    return 'ListResponse(results: $results, page: $page, totalPage: $totalPage, totalResults: $totalResults)';
  }
}
