import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class EventCardWidget extends StatelessWidget {
  final String? image;
  final String? title;
  final String? date;

  const EventCardWidget({super.key, this.image, this.title, this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title!,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                date!,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: 180,
            width: MediaQuery.of(context).size.width,
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: image!,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
