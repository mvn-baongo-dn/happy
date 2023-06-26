import 'package:flutter/material.dart';

import '../bloc/login_presenter.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    required this.presenter,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final LoginPresenter presenter;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 64,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: const Text("Login"),
        ),
      );
}
