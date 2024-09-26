
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'animal_state.dart';

class AnimalCubit extends Cubit<AnimalState> {
	AnimalCubit() : super(AnimalState(text: 'Cat', icon: Icons.access_time));

	void toggleAnimal() {
		if (state.text == 'Cat') {
			emit(AnimalState(text: 'Dog', icon: Icons.person));
		} else {
			emit(AnimalState(text: 'Cat', icon: Icons.access_time));
		}
	}
}
