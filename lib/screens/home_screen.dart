import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/dog_bloc.dart';
import '../model/dog_model.dart';
import '../widgets/bottom_sheet.dart';
import '../widgets/dog_container.dart';
import '../widgets/filter_input.dart';
import '../screens/splash_screen.dart';
import 'dog_details_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DogBloc, DogState>(
      builder: (context, state) {
        if (state is DogLoading) {
          return const SplashScreen();
        }
        if (state is DogLoaded) {
          List<Dog> dogs = state.dogs;
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: const Text(
                'This is awesome',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            body: SafeArea(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: _buildDogGrid(dogs, context),
                  ),
                  Positioned(
                    bottom: 44,
                    left: 0,
                    right: 0,
                    child: FilterInput(dogs: dogs),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: const DogBottomSheet(
                imageUrl: '', selectedIndex: 0),
          );
        }
        return const Scaffold(
          body: Center(
            child: Text('Something went wrong!'),
          ),
        );
      },
    );
  }
}

  Widget _buildDogGrid(List<Dog> dogs, BuildContext context) {
    return GridView.count(
      primary: false,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      crossAxisCount: 2,
      children: dogs.map((dog) {
        return GestureDetector(
          onTap: () {
            _showDogDetails(context, dog);
          },
          child: DogContainerWidget(
            name: dog.message.keys.first.toString(),
            imageUrl: dog.image,
            breed: dog.message.keys.first.toString(),
            subBreed: dog.message.values.first.cast<String>().toList(),
          ),
        );
      }).toList(),
    );
  }

  void _showDogDetails(BuildContext context, Dog dog) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DogDetailsScreen(
          breed: dog.message.keys.first.toString(),
          subBreeds: dog.message.values.first.cast<String>().toList(),
          imageUrl: dog.image,
        ),
      ),
    );
  }

