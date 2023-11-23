// screens/home_screen.dart

import 'package:dogapi_flutter_bloc/screens/splash_screen.dart';
import 'package:dogapi_flutter_bloc/widgets/dog_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/dog_bloc.dart';
import '../model/dog_model.dart';
import '../widgets/bottom_sheet.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    List<Dog> dogs;

    return BlocBuilder<DogBloc, DogState>(builder: (context, state) {
      if (state is DogLoading) {
        return const SplashScreen();
      }
      if (state is DogLoaded) {
        dogs = state.dogs;
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text(
              'Home',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          body: Stack(
            children: [
              GridView.count(
                primary: false,
                padding: const EdgeInsets.all(16),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                crossAxisCount: 2,
                children: dogs.map((dog) {
                  //Print images
                  return DogContainerWidget(
                      name: dog.message.keys.first.toString(),
                      imageUrl: dog.image,
                    );
                }).toList(),
              ),
              Container(),
              /*FilterInput(onFilterChanged: (value) {
                print(value);
              }),*/
            ],
          ),
          bottomNavigationBar: const DogBottomSheet(imageUrl: '', selectedIndex: 0),
        );
      }
      return const Scaffold(
        body: Center(
          child: Text('Something went wrong!'),
        ),
      );
    });
  }
}
