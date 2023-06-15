import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/custom_text_form_field.dart';
import '../bloc/login_presenter.dart';
import '../bloc/login_state.dart';

class PasswordFormField extends StatelessWidget {
  const PasswordFormField({
    required this.presenter,
    Key? key,
  }) : super(key: key);

  final LoginPresenter presenter;

  @override
  Widget build(BuildContext context) => BlocBuilder<LoginPresenter, LoginState>(
        bloc: presenter,
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, state) => CustomTextFormField(
          hintText: '',
          labelText: '',
          isPasswordField: true,
          keyboardType: TextInputType.text,
          errorText: state.password.errorText,
          onChanged: presenter.onPasswordChanged,
        ),
      );
}
