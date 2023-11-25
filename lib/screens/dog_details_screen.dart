import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DogDetailsScreen extends StatelessWidget {
  final String breed;
  final List<String> subBreeds;
  final String imageUrl;

  DogDetailsScreen({
    required this.breed,
    required this.subBreeds,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 90, 8, 90),
      child: AlertDialog(
        contentPadding: const EdgeInsets.all(0.0),
        content: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 400,
                    width: 400,
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
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
                  _buildTitleAndText('Breed', breed),
                  _buildTitleAndText('Sub Breed', subBreeds.join('\n')),
                  ElevatedButton(
                    onPressed: () {
                      print('Generate');
                    },
                    child: const Text('Generate'),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the AlertDialog
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleAndText(String title, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 4),
        const Divider(
          height: 2,
          thickness: 0.5,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
