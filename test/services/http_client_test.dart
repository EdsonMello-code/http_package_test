import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import '../../bin/services/http_client_impl.dart';

void main() {
  test('This is most return a post', () async {
    final client = MockClientHttp();

    final httpClient = HttpPackageClient(http: client);

    when(() {
      return client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
    }).thenAnswer((invocation) async => Response('{"title": "Test"}', 200));

    final response = await httpClient
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
    expect(response.body, '{"title": "Test"}');
  });
}

class MockClientHttp extends Mock implements Client {}
