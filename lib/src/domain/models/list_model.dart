// ignore_for_file: public_member_api_docs, sort_constructors_first
class ListModel<T> {
  ListModel({
    this.results,
    this.totalPages,
  });

  List<T>? results;

  int? totalPages;
}
