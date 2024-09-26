
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/animal_cubit.dart';

class AnimalWidget extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return GestureDetector(
			onTap: () {
				context.read<AnimalCubit>().toggleAnimal();
			},
			child: BlocBuilder<AnimalCubit, AnimalState>(
				builder: (context, state) {
					return Row(
						mainAxisAlignment: MainAxisAlignment.center,
						children: [
							Icon(state.icon),
							SizedBox(width: 8),
							Text(state.text),
						],
					);
				},
			),
		);
	}
}
