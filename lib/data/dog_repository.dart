import 'package:http/http.dart' as http;
import '../model/dog_model.dart';

class DogRepository {
  Future<List<Dog>> getDogList() async {
    final response = await http.get(Uri.parse('https://dog.ceo/api/breeds/list/all'));
    if (response.statusCode == 200) {
      final dog = dogFromJson(response.body);
      return dog.message.entries.map((e) => Dog(message: {}, status: '')).toList();
    } else {
      throw Exception('Failed to load dogs');
    }
  }

  Future<Map<String, List<String>>> getDogImages(String breed, String subBreed) async {
    final response = await http.get(Uri.parse('https://dog.ceo/api/breed/$breed/$subBreed/images'));
    if (response.statusCode == 200) {
      final dog = dogFromJson(response.body);
      return dog.message;
    } else {
      throw Exception('Failed to load dogs');
    }
  }
}