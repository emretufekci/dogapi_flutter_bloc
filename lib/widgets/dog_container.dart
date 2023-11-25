import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DogContainerWidget extends StatelessWidget {
  const DogContainerWidget({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.breed,
    required this.subBreed,
  }) : super(key: key);

  final String name;
  final String imageUrl;
  final String breed;
  final List<String> subBreed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0, // Set a fixed height for the container
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey[200], // Add your desired background color
      ),
      child: GestureDetector(
        onTap: () {
          showCupertinoModalPopup(
            context: context,
            builder: (BuildContext context) {
              if (kDebugMode) {
                print('name: $name');
              }
              return CupertinoActionSheet(
                title: Text(name),
                message: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // Center the contents vertically
                  crossAxisAlignment: CrossAxisAlignment.center, // Center the contents horizontally
                  children: [
                    CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 200, // Adjust the height as needed
                      errorWidget: (context, msg, object) => const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.error_outline_outlined),
                            Text("No image available"),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10), // Add some space between the image and breed information
                    const Text(
                      'Breed',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      breed,
                      style: const TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10), // Add some space between breed and sub-breed information
                    const Text(
                      'SubBreed',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      subBreed.join(', '),
                      style: const TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                actions: [
                  CupertinoActionSheetAction(
                    onPressed: () {
                      // Add your code for the "Generate" button action here
                      // This is where you handle the generation logic
                    },
                    child: const Text('Generate'),
                  ),
                  CupertinoActionSheetAction(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Close'),
                  ),
                ],
              );
            },
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover, // Adjust the fit to cover the fixed container size
              width: double.infinity, // Take up the entire width of the container
              height: 144, // Set a fixed height for the image
              errorWidget: (context, msg, object) => const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline_outlined),
                    Text("No image available"),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              name,
              style: const TextStyle(
                  fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
