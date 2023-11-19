part of 'dog_bloc.dart';

@immutable
abstract class DogEvent extends Equatable {
  const DogEvent();

  //Equatable override
  @override
  List<Object> get props => [];
}

class DogListRequested extends DogEvent {
  final Dog dog;
  const DogListRequested({required this.dog});
  @override
  List<Object> get props => [dog];
}

class DogSearchRequested extends DogEvent {
  final String query;

  const DogSearchRequested({required this.query});
  @override
  List<Object> get props => [query];
}

class DogGenerateRequested extends DogEvent {
  final String breed;
  final String subBreed;

  const DogGenerateRequested({required this.breed, required this.subBreed});

  @override
  List<Object> get props => [breed, subBreed];
}