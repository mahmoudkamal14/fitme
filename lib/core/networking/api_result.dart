abstract class ApiResult<T> {
  const ApiResult();

  factory ApiResult.success(T data) = Success;
  factory ApiResult.failure(String message) = Failure;
}

class Success<T> extends ApiResult<T> {
  final T data;

  Success(this.data);
}

class Failure<T> extends ApiResult<T> {
  final String message;

  Failure(this.message);
}
