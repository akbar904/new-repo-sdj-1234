
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:com.example.flutter_cubit_demo/widgets/animal_widget.dart';

// Mock AnimalCubit for testing
class MockAnimalCubit extends MockCubit<AnimalState> implements AnimalCubit {}

void main() {
	group('AnimalWidget Tests', () {
		late MockAnimalCubit mockAnimalCubit;

		setUp(() {
			mockAnimalCubit = MockAnimalCubit();
		});

		testWidgets('displays Cat text with clock icon initially', (WidgetTester tester) async {
			// Define initial state for AnimalCubit
			when(() => mockAnimalCubit.state).thenReturn(AnimalState(text: 'Cat', icon: Icons.access_time));

			// Build the widget
			await tester.pumpWidget(
				BlocProvider<AnimalCubit>.value(
					value: mockAnimalCubit,
					child: MaterialApp(
						home: Scaffold(
							body: AnimalWidget(),
						),
					),
				),
			);

			// Verify the widget displays Cat with clock icon
			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('displays Dog text with person icon after tapping', (WidgetTester tester) async {
			// Define initial state for AnimalCubit
			when(() => mockAnimalCubit.state).thenReturn(AnimalState(text: 'Cat', icon: Icons.access_time));

			// Build the widget
			await tester.pumpWidget(
				BlocProvider<AnimalCubit>.value(
					value: mockAnimalCubit,
					child: MaterialApp(
						home: Scaffold(
							body: AnimalWidget(),
						),
					),
				),
			);

			// Simulate tapping on the AnimalWidget
			await tester.tap(find.byType(AnimalWidget));
			await tester.pump();

			// Verify the toggleAnimal method is called
			verify(() => mockAnimalCubit.toggleAnimal()).called(1);

			// Define the new state after tapping
			when(() => mockAnimalCubit.state).thenReturn(AnimalState(text: 'Dog', icon: Icons.person));
			await tester.pump();

			// Verify the widget displays Dog with person icon
			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
