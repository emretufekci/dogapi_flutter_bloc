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
      height: 150.0,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: imageUrl.isNotEmpty ? null : Colors.grey[200],
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
                      //Generate a new image
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
        child: Stack(
          children: [
            if (imageUrl.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
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
              ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: imageUrl.isNotEmpty
                      ? Colors.black.withOpacity(0.5)
                      : null,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
