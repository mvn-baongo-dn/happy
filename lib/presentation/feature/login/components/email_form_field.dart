import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/custom_text_form_field.dart';
import '../bloc/login_presenter.dart';
import '../bloc/login_state.dart';

class EmailFormField extends StatelessWidget {
  const EmailFormField({
    required this.presenter,
    Key? key,
  }) : super(key: key);

  final LoginPresenter presenter;

  @override
  Widget build(BuildContext context) => BlocBuilder<LoginPresenter, LoginState>(
        bloc: presenter,
        buildWhen: (previous, current) => previous.email != current.email,
        builder: (context, state) => CustomTextFormField(
          hintText: '',
          labelText: '',
          keyboardType: TextInputType.emailAddress,
          errorText: state.email.errorText,
          onChanged: presenter.onEmailChanged,
        ),
      );
}
