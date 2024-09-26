
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.flutter_cubit_demo/main.dart';

class MockAnimalCubit extends MockCubit<AnimalState> implements AnimalCubit {}

void main() {
	group('main.dart', () {
		testWidgets('MyApp initialization test', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());

			expect(find.byType(MaterialApp), findsOneWidget);
			expect(find.byType(HomeScreen), findsOneWidget);
		});

		group('AnimalCubit tests', () {
			late MockAnimalCubit mockAnimalCubit;

			setUp(() {
				mockAnimalCubit = MockAnimalCubit();
			});

			blocTest<MockAnimalCubit, AnimalState>(
				'emits Cat state initially',
				build: () => mockAnimalCubit,
				act: (cubit) => when(() => cubit.state)
					.thenReturn(AnimalState(text: 'Cat', icon: Icons.access_time)),
				expect: () => [AnimalState(text: 'Cat', icon: Icons.access_time)],
			);

			blocTest<MockAnimalCubit, AnimalState>(
				'emits Dog state when toggleAnimal is called',
				build: () => mockAnimalCubit,
				act: (cubit) {
					when(() => cubit.toggleAnimal()).thenAnswer((_) {
						cubit.emit(AnimalState(text: 'Dog', icon: Icons.person));
					});
					cubit.toggleAnimal();
				},
				expect: () => [AnimalState(text: 'Dog', icon: Icons.person)],
			);
		});

		testWidgets('HomeScreen displays Cat initially', (WidgetTester tester) async {
			await tester.pumpWidget(
				BlocProvider<AnimalCubit>(
					create: (_) => AnimalCubit(),
					child: MyApp(),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('Tapping text changes it to Dog', (WidgetTester tester) async {
			final animalCubit = AnimalCubit();

			await tester.pumpWidget(
				BlocProvider<AnimalCubit>(
					create: (_) => animalCubit,
					child: MyApp(),
				),
			);

			await tester.tap(find.text('Cat'));
			await tester.pumpAndSettle();

			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
