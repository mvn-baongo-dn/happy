import 'package:flutter/material.dart';

class PasswordFormField extends StatelessWidget {
  const PasswordFormField({
    required this.passwordFocusNode,
    required this.passwordController,
    Key? key,
  }) : super(key: key);

  final FocusNode passwordFocusNode;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: TextField(
          focusNode: passwordFocusNode,
          controller: passwordController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Password",
          ),
          obscureText: true,
          style: Theme.of(context).textTheme.bodyMedium,
          onChanged: (value) {},
        ),
      );
}
