
import 'package:flutter/material.dart';

class AnimalModel {
	final String text;
	final IconData icon;

	AnimalModel({required this.text, required this.icon});

	Map<String, dynamic> toJson() {
		return {
			'text': text,
			'icon': icon.codePoint.toString(),
		};
	}

	factory AnimalModel.fromJson(Map<String, dynamic> json) {
		return AnimalModel(
			text: json['text'],
			icon: IconData(int.parse(json['icon']), fontFamily: 'MaterialIcons'),
		);
	}
}
