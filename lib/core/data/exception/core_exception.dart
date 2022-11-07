
class CoreException implements Exception {
  final String message;
  CoreException(this.message);

  @override
  String toString() => message;
}
