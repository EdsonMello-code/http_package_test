abstract class MyHttpClient {
  final dynamic http;
  MyHttpClient({required this.http});
  Future<dynamic> get(Uri uri);
}
