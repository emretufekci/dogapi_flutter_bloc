import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../screens/dog_details_screen.dart';

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
              return DogDetailsScreen(
                breed: breed,
                subBreeds: subBreed,
                imageUrl: imageUrl,
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
                  errorWidget: (context, msg, object) => Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black, // Specify the border color
                        width: 0.5, // Specify the border width
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)), // Optional: Specify border radius
                    ),
                    child: const Center(
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
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
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
