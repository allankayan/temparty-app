import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  static const size = Size.fromHeight(60.0);

  final String? title;
  final Widget? leading;
  final List<Widget>? actions;

  const CustomAppBar({Key? key, this.title, this.leading, this.actions})
      : preferredSize = size,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(
        color: Colors.purpleAccent,
      ),
      actionsIconTheme: const IconThemeData(
        color: Colors.deepPurpleAccent,
      ),
      leading: leading,
      title: GradientText(
        title ?? 'Temparty',
        style: const TextStyle(
          fontSize: 20,
          color: Colors.deepPurple,
          fontWeight: FontWeight.w700,
        ),
        colors: const [
          Colors.purpleAccent,
          Colors.deepPurpleAccent,
        ],
      ),
      actions: actions,
    );
  }
}
