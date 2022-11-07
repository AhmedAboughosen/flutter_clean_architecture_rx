
abstract class Resource<T> {}

class SuccessResponse<T> extends Resource<T> {
  final T? content;

  SuccessResponse({
    this.content,
  });
}

class Loading<T> extends Resource<T> {
  Loading();
}

class FailureResponse<T> extends Resource<T> {
  final Object messages;

  FailureResponse({required this.messages});
}
