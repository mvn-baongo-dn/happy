import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/food_tourism_detail_presenter.dart';
import '../bloc/food_tourism_detail_state.dart';

class ExampleComponent extends StatelessWidget {
  const ExampleComponent({
    required this.presenter,
    Key? key,
  }) : super(key: key);

  final FoodTourismDetailPresenter presenter;

  //TODO: (remove) An example of a child component have state
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<FoodTourismDetailPresenter, FoodTourismDetailState>(
        bloc: presenter,
        buildWhen: (previous, current) => false,
        builder: (context, state) => Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.green,
        ),
      );
}
