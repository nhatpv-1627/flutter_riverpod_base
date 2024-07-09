enum ProcessStatus {
  initial,
  loading,
  success,
  failure,
  loadingMore,
  refreshing
}

extension ProcessStatusExt on ProcessStatus {
  bool get isInitial => this == ProcessStatus.initial;
  bool get isLoading => this == ProcessStatus.loading;
  bool get isSuccess => this == ProcessStatus.success;
  bool get isFailure => this == ProcessStatus.failure;
  bool get isLoadingMore => this == ProcessStatus.loadingMore;
  bool get isRefreshing => this == ProcessStatus.refreshing;
}
