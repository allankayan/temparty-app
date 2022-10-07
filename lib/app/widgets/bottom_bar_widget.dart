import 'package:flutter/material.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({super.key});

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(15),
        topLeft: Radius.circular(15),
      ),
      child: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          currentIndex: index,
          elevation: 10,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.deepPurple,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.70),
          selectedFontSize: 12,
          unselectedFontSize: 12,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
          onTap: (int newIndex) {
            setState(() {
              index = newIndex;
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: 'Principal',
              icon: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.home_rounded),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Convites',
              icon: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.qr_code_rounded),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Perfil',
              icon: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.account_circle),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
