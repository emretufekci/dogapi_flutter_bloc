
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../model/dog_model.dart';

part 'dog_event.dart';
part 'dog_state.dart';

class DogBloc extends Bloc<DogEvent, DogState> {
  DogBloc() : super(DogInitial()) {

    on<DogListRequested>((event, emit) async {},
    );

    on<DogGenerateRequested>((event, emit) async {},
    );

    on<DogSearchRequested>((event, emit) async {},
    );
  }
}
