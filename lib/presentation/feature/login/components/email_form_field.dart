import 'package:flutter/material.dart';

class EmailFormField extends StatelessWidget {
  const EmailFormField({
    required this.emailController,
    required this.emailFocusNode,
    required this.function,
    Key? key,
  }) : super(key: key);

  final TextEditingController emailController;
  final FocusNode emailFocusNode;

  final Function(String) function;

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
            focusNode: emailFocusNode,
            controller: emailController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Email",
            ),
            style: Theme.of(context).textTheme.bodyMedium,
            onChanged: function),
      );
}
