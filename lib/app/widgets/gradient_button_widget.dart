import 'package:flutter/material.dart';

class GradientButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final IconData icon;
  final Color left;
  final Color right;

  const GradientButtonWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
    required this.left,
    required this.right,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 15,
              offset: const Offset(0, 7),
            )
          ],
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: [
            left,
            right,
          ])),
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0, left: 8.0),
        child: ElevatedButton.icon(
          label: Text(text),
          icon: Icon(
            icon,
            size: 20.0,
          ),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
