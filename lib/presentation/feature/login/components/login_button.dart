import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login_presenter.dart';
import '../bloc/login_state.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    required this.presenter,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final LoginPresenter presenter;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) => BlocBuilder<LoginPresenter, LoginState>(
        bloc: presenter,
        buildWhen: (previous, current) =>
            previous.isValidButton != current.isValidButton,
        builder: (context, state) => ElevatedButton(
          onPressed: state.isValidButton ? onPressed : null,
          child: Text(
            '',
          ),
        ),
      );
}
