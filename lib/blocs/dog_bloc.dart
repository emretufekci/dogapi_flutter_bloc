
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/dog_repository.dart';
import '../model/dog_model.dart';
part 'dog_event.dart';
part 'dog_state.dart';

class DogBloc extends Bloc<DogEvent, DogState> {
  DogBloc() : super(DogInitial()) {

    on<DogListRequested>((event, emit) async {
      emit(DogLoading());
        try {
          final dog = await DogRepository().getDogList();
          emit(DogLoaded(dogs: dog));
        } catch (e) {
          emit(DogError(message: e.toString()));
        }
      },
    );

    on<DogGenerateRequested>((event, emit) async {
      emit(DogLoading());
        try {
          final dog = await DogRepository().getDogImages(event.breed, event.subBreed);
          emit(DogLoaded(dogs: [Dog(message: dog, status: '')]));
        } catch (e) {
          emit(DogError(message: e.toString()));
        }
      },
    );

    on<DogSearchRequested>((event, emit) async {
      emit(DogLoading());
        try {
          final dog = await DogRepository().getDogList();
          final filteredDog = dog.where((element) => element.message.containsKey(event.query)).toList();
          emit(DogLoaded(dogs: filteredDog));
        } catch (e) {
          emit(DogError(message: e.toString()));
        }
      },
    );
  }
}
