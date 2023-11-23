import 'dart:convert';

import 'package:http/http.dart' as http;
import '../model/dog_model.dart';

class DogRepository {
  Future<List<Dog>> getDogList() async {
    final response = await http.get(Uri.parse('https://dog.ceo/api/breeds/list/all'));

    if (response.statusCode == 200) {
      final dog = dogFromJson(response.body);
      final dogList = <Dog>[];

      await Future.wait(dog.message.entries.map((entry) async {
        final breed = entry.key;
        final subBreeds = entry.value;
        final imageResponse = await http.get(Uri.parse('https://dog.ceo/api/breed/$breed/images/random'));

        if (imageResponse.statusCode == 200) {
          final imageResponseJson = jsonDecode(imageResponse.body);
          final image = imageResponseJson['message'];
          dogList.add(Dog(message: {breed: subBreeds}, status: dog.status, image: image));
        } else if (imageResponse.statusCode == 404) {
          dogList.add(Dog(message: {breed: subBreeds}, status: dog.status, image: ''));
        } else {
          throw Exception('Failed to load image');
        }
      }));

      return dogList;
    } else {
      throw Exception('Failed to load dogs');
    }
  }


  Future<Map<String, List<String>>> getDogImages(String breed, String subBreed) async {
    final response = await http.get(Uri.parse('https://dog.ceo/api/breed/$breed/images'));
    if (response.statusCode == 200) {
      final dog = dogFromJson(response.body);
      return dog.message;
    } else {
      throw Exception('Failed to load dogs');
    }
  }
}
