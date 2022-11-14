import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class StoryCardWidget extends StatelessWidget {
  final String? image;
  final String? name;

  const StoryCardWidget({super.key, this.image, this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0, bottom: 5),
          child: InkWell(
            child: SizedBox(
              width: 80,
              height: 125,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            onTap: () {},
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: SizedBox(
              height: 20,
              width: 80,
              child: Text(
                name!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
