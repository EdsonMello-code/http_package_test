import 'package:http/http.dart';

import 'http_client.dart';

class HttpPackageClient implements MyHttpClient {
  @override
  final Client http;

  HttpPackageClient({required this.http});

  @override
  Future<Response> get(Uri uri) async {
    final response = await http.get(uri);
    return response;
  }
}
