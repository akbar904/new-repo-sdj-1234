
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.flutter_cubit_demo/screens/home_screen.dart';

// Mock classes for dependencies
class MockAnimalCubit extends MockCubit<AnimalState> implements AnimalCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		testWidgets('displays initial animal text and icon', (WidgetTester tester) async {
			// Arrange
			final mockAnimalCubit = MockAnimalCubit();
			when(() => mockAnimalCubit.state).thenReturn(AnimalState(animal: AnimalModel(text: 'Cat', icon: Icons.access_time)));

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AnimalCubit>(
						create: (_) => mockAnimalCubit,
						child: HomeScreen(),
					),
				),
			);

			// Act & Assert
			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('displays toggled animal text and icon when clicked', (WidgetTester tester) async {
			// Arrange
			final mockAnimalCubit = MockAnimalCubit();
			whenListen(
				mockAnimalCubit,
				Stream.fromIterable([
					AnimalState(animal: AnimalModel(text: 'Cat', icon: Icons.access_time)),
					AnimalState(animal: AnimalModel(text: 'Dog', icon: Icons.person)),
				]),
				initialState: AnimalState(animal: AnimalModel(text: 'Cat', icon: Icons.access_time)),
			);

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AnimalCubit>(
						create: (_) => mockAnimalCubit,
						child: HomeScreen(),
					),
				),
			);

			// Act
			await tester.tap(find.text('Cat'));
			await tester.pump();

			// Assert
			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
