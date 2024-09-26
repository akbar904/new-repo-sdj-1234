
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:your_project/cubits/animal_cubit.dart';
import 'package:your_project/cubits/animal_state.dart';

class MockAnimalCubit extends MockCubit<AnimalState> implements AnimalCubit {}

void main() {
	group('AnimalCubit', () {
		late AnimalCubit animalCubit;

		setUp(() {
			animalCubit = AnimalCubit();
		});

		tearDown(() {
			animalCubit.close();
		});

		test('initial state is AnimalState with text "Cat" and icon Icons.access_time', () {
			expect(animalCubit.state, equals(AnimalState(text: 'Cat', icon: Icons.access_time)));
		});

		blocTest<AnimalCubit, AnimalState>(
			'emits [AnimalState with text "Dog" and icon Icons.person] when toggleAnimal is called from initial state',
			build: () => animalCubit,
			act: (cubit) => cubit.toggleAnimal(),
			expect: () => [AnimalState(text: 'Dog', icon: Icons.person)],
		);

		blocTest<AnimalCubit, AnimalState>(
			'emits [AnimalState with text "Cat" and icon Icons.access_time] when toggleAnimal is called from Dog state',
			build: () => animalCubit..toggleAnimal(), // Switch to Dog state first
			act: (cubit) => cubit.toggleAnimal(),
			expect: () => [AnimalState(text: 'Cat', icon: Icons.access_time)],
		);
	});
}
