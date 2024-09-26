
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/animal_cubit.dart';
import '../widgets/animal_widget.dart';

class HomeScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Animal App'),
			),
			body: Center(
				child: BlocBuilder<AnimalCubit, AnimalState>(
					builder: (context, state) {
						return AnimalWidget(
							text: state.animal.text,
							icon: state.animal.icon,
							onTap: () => context.read<AnimalCubit>().toggleAnimal(),
						);
					},
				),
			),
		);
	}
}
