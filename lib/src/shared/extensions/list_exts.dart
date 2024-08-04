extension ListExtensions<T> on Iterable<T>? {
  bool isNullOrEmpty() {
    return this == null || this!.isEmpty;
  }

  Iterable<T> orEmpty() {
    return this ?? [];
  }
}
