typedef Empty = Function();
typedef Loading = Function();
typedef OrElse = Function();
typedef Success<Data> = Function(Data data);
typedef Error = Function(String message, Exception? exception);

abstract class AppState {
  dynamic when({
    Empty? empty,
    Loading? loading,
    Success? success,
    Error? error,
    required OrElse orElse,
  });

  static empty() => StateEmpty();
  static loading() => StateLoading();
  static success<Data>(Data data) => StateSuccess(data);
  static error(String message, {Exception? exception}) =>
      StateError(message, exception: exception);
}

class StateEmpty extends AppState {
  @override
  when(
      {Empty? empty,
      Loading? loading,
      Success? success,
      Error? error,
      required OrElse orElse}) {
    if (empty != null) {
      return empty();
    } else {
      return orElse();
    }
  }
}

class StateLoading extends AppState {
  @override
  when(
      {Empty? empty,
      Loading? loading,
      Success? success,
      Error? error,
      required OrElse orElse}) {
    if (loading != null) {
      return loading();
    } else {
      return orElse();
    }
  }
}

class StateSuccess<Data> extends AppState {
  final Data data;

  StateSuccess(this.data);
  @override
  when(
      {Empty? empty,
      Loading? loading,
      Success? success,
      Error? error,
      required OrElse orElse}) {
    if (success != null) {
      return success(data);
    } else {
      return orElse();
    }
  }
}

class StateError extends AppState {
  final String message;
  final Exception? exception;

  StateError(this.message, {this.exception});
  @override
  when(
      {Empty? empty,
      Loading? loading,
      Success? success,
      Error? error,
      required OrElse orElse}) {
    if (error != null) {
      return error(message, exception);
    } else {
      return orElse();
    }
  }
}
