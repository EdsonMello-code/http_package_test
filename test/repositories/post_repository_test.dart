import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import '../../bin/services/http_client.dart';
import '../../bin/repositories/post_repository.dart';

class MockitoExample extends Mock implements MyHttpClient {}

void main() {
  MockitoExample mockitoExample = MockitoExample();
  final repository = PostRepositoryImpl(httpclient: mockitoExample);

  group('Post | ', () {
    test('This is most return a post with title Test', () async {
      when(
        () => mockitoExample.get(
          Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
        ),
      ).thenAnswer((value) async {
        return http.Response('{"title": "Test"}', 200);
      });

      final response = await repository.getPost();

      expect(response.title, equals("Test"));
    });
  });
}


// casos de test