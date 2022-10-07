import 'package:flutter/material.dart';

class StoryCardWidget extends StatelessWidget {
  const StoryCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      elevation: 2,
      child: InkWell(
        child: const SizedBox(
          width: 80,
          height: 125,
        ),
        onTap: () {},
      ),
    );
  }
}
