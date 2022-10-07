import 'package:flutter/material.dart';

class EventCardWidget extends StatelessWidget {
  final AssetImage? image;
  const EventCardWidget({
    super.key,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
      child: Card(
        semanticContainer: true,
        child: SizedBox(
          height: 125,
          child: Ink.image(
            image: image ?? const AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
            child: InkWell(
              onTap: () {},
            ),
          ),
        ),
      ),
    );
  }
}
