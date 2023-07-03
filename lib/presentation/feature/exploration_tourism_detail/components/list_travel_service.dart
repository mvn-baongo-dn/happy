import 'package:flutter/material.dart';

class ListTravelService extends StatelessWidget {
  const ListTravelService({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 5,
        ),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(2),
            width: 165,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                12,
              ),
              color: Colors.blue,
            ),
          );
        },
      ),
    );
  }
}
