//Singleton  pattern.
class HttpBaseUrl {
  static final HttpBaseUrl httpBaseUrl = HttpBaseUrl._internal();

  late String url;

  factory HttpBaseUrl({required String url}) {
    httpBaseUrl.url = url;
    return httpBaseUrl;
  }

  HttpBaseUrl._internal();
}
