
import 'package:flutter_test/flutter_test.dart';
import 'package:lib/models/animal_model.dart';

void main() {
	group('AnimalModel', () {
		test('should create an AnimalModel with correct text and icon', () {
			final animal = AnimalModel(text: 'Cat', icon: Icons.access_time);

			expect(animal.text, 'Cat');
			expect(animal.icon, Icons.access_time);
		});

		test('should serialize AnimalModel to JSON', () {
			final animal = AnimalModel(text: 'Cat', icon: Icons.access_time);
			final json = animal.toJson();

			expect(json, {'text': 'Cat', 'icon': 'access_time'});
		});

		test('should deserialize JSON to AnimalModel', () {
			final json = {'text': 'Cat', 'icon': 'access_time'};
			final animal = AnimalModel.fromJson(json);

			expect(animal.text, 'Cat');
			expect(animal.icon, Icons.access_time);
		});
	});
}
