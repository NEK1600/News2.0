import 'package:news2_0/data/model/well.dart';
import 'package:news2_0/data/remote/api_client.dart';

class Repository {
  ApiClient _clientProvider = ApiClient();

  Future<Well> getNewsRepository() async {
    return await _clientProvider.fetchAlbum();
  }

  Future<Well> getNewsRepositoryTwo(String qWord) async {
    return await _clientProvider.fetchAlbumTwo(qWord);
  }

}