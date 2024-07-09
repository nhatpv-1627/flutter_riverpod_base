extension ListExtensions<T> on List<T>? {
  bool isNullOrEmpty() {
    return this == null || this!.isEmpty;
  }
}
