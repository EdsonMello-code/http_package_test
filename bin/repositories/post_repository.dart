import '../models/todo_model.dart';
import '../services/http_client.dart';

abstract class PostRepository {
  final MyHttpClient httpclient;

  PostRepository({required this.httpclient});
  Future<PostModel> getPost();
}

class PostRepositoryImpl implements PostRepository {
  MyHttpClient httpclient;

  PostRepositoryImpl({required this.httpclient});

  @override
  Future<PostModel> getPost() async {
    final response = await httpclient
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

    final data = PostModel.fromJson(response.body);

    return PostModel.fromMap(data);
  }
}
