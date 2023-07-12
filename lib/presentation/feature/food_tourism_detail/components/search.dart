import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).dialogBackgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 5,
      ),
      child: TextField(
        // focusNode: emailFocusNode,
        // controller: emailController,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "Bạn thích ăn gì",
        ),
        style: Theme.of(context).textTheme.bodyMedium,
        // onChanged: function,
      ),
    );
  }
}
