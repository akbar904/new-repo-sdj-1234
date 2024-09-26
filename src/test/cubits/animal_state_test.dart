
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:your_project_name/lib/cubits/animal_state.dart';

// Assuming AnimalState is a class with properties `text` and `icon`
void main() {
	// Grouping tests related to AnimalState
	group('AnimalState', () {
		test('initial state should have text "Cat" and clock icon', () {
			final state = AnimalState.initial();
			expect(state.text, 'Cat');
			expect(state.icon, Icons.access_time); // Assuming clock icon is Icons.access_time
		});

		test('toggled state should have text "Dog" and person icon', () {
			final state = AnimalState.toggled();
			expect(state.text, 'Dog');
			expect(state.icon, Icons.person); // Assuming person icon is Icons.person
		});

		test('serialize and deserialize AnimalState', () {
			final state = AnimalState(text: 'Cat', icon: Icons.access_time);
			final json = state.toJson();
			final newState = AnimalState.fromJson(json);
			expect(newState.text, state.text);
			expect(newState.icon, state.icon);
		});

		// Mock and other tests can be added here if needed
	});
}
