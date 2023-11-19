import 'package:http/http.dart' as http;
import '../model/dog_model.dart';

class DogRepository {
  Future<List<Dog>> getDogList() async {
    final response = await http.get(Uri.parse('https://dog.ceo/api/breeds/list/all'));
    if (response.statusCode == 200) {
      final dog = dogFromJson(response.body);

      // Here, map each entry in the dog.message map to a Dog object
      final dogList = dog.message.entries.map((entry) {
        final breed = entry.key;
        final subBreeds = entry.value;
        return Dog(message: {breed: subBreeds}, status: '');
      }).toList();

      //Print
       dogList.forEach((element) {
         //print(element.message);
       });
      return dogList;
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
