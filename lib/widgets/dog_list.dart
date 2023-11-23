import 'package:flutter/material.dart';
import '../model/dog_model.dart';
import 'bottom_sheet.dart';

class DogList extends StatelessWidget {
  final List<Dog> dogs;

  const DogList({super.key, required this.dogs});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(16),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      crossAxisCount: 2,
      children: dogs
          .map(
            (dog) => GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => const DogBottomSheet(
                    imageUrl: "dog.imageUrl", selectedIndex: 1,
                  ),
                );
              },
              child: Stack(
            children: [
              ClipRRect(
              borderRadius: BorderRadius.circular(8),
            child: Image.asset(
            'assets/images/mami.jpg',
            fit: BoxFit.cover,
            height: 163.5,
            width: 163.5,
          ),
        ),
      ],
    ),
            ),
          )
          .toList(),
    );
  }
}