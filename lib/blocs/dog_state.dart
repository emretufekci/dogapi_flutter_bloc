part of 'dog_bloc.dart';

@immutable
abstract class DogState extends Equatable {
  const DogState();

  //Equatable override
  @override
  List<Object> get props => [];
}

class DogInitial extends DogState {}

class DogLoading extends DogState {}

class DogLoaded extends DogState {
  final List<Dog> dogs;

  const DogLoaded({required this.dogs});

  @override
  List<Object> get props => [dogs];
}