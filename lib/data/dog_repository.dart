import 'dart:convert';

import 'package:http/http.dart' as http;
import '../model/dog_model.dart';

class DogRepository {
  Future<List<Dog>> getDogList() async {
    final response = await http.get(Uri.parse('https://dog.ceo/api/breeds/list/all'));
    var dogList = <Dog>[];

      if (response.statusCode == 200) {
        final dog = dogFromJson(response.body);

        dogList = dog.message.entries.map((entry) {
          final breed = entry.key;
          final subBreeds = entry.value;
          final status = dog.status;
          return Dog(message: {breed: subBreeds}, status: status, image: '');
        }).toList();
      } else {
        throw Exception('Failed to load dogs');
      }

      for (var dog in dogList) {
        final breed = dog.message.keys.first;
        final imageStatus = dog.status;
        final imageResponse = await http.get(Uri.parse('https://dog.ceo/api/breed/$breed/images/random'));


        if (imageResponse.statusCode == 200) {
          final imageResponseJson = jsonDecode(imageResponse.body);
          final image = imageResponseJson['message'];
          dog.image = image;
          dog.status = imageStatus;
        } else if (imageResponse.statusCode == 404) {
          dog.image = '';
          dog.status = imageStatus;
        }
        else {
          throw Exception('Failed to load image');
        }
      }


      return dogList;
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
