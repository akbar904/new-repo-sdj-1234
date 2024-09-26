
import 'package:flutter/material.dart';

class AnimalState {
	final String text;
	final IconData icon;

	const AnimalState({required this.text, required this.icon});

	factory AnimalState.initial() {
		return AnimalState(text: 'Cat', icon: Icons.access_time);
	}

	factory AnimalState.toggled() {
		return AnimalState(text: 'Dog', icon: Icons.person);
	}

	Map<String, dynamic> toJson() {
		return {
			'text': text,
			'icon': icon.codePoint,
		};
	}

	factory AnimalState.fromJson(Map<String, dynamic> json) {
		return AnimalState(
			text: json['text'],
			icon: IconData(json['icon'], fontFamily: 'MaterialIcons'),
		);
	}
}
