import 'package:flutter_modular/flutter_modular.dart';
import 'package:temparty/app/pages/events/events_page.dart';
import 'package:temparty/app/pages/main/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:temparty/app/pages/profile/profile_page.dart';
import 'package:temparty/app/pages/search/search_page.dart';
import 'package:temparty/app/pages/tickets/tickets_page.dart';

class MainPage extends StatefulWidget {
  final String title;
  const MainPage({Key? key, this.title = 'MainPage'}) : super(key: key);
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  final MainController controller = Modular.get();
  final _controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      backgroundColor: Colors.deepPurple,
      navBarHeight: kBottomNavigationBarHeight + 20,
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      navBarStyle: NavBarStyle.style9,
      screens: _buildScreens(),
      items: _navBarsItems(),
    );
  }
}

List<Widget> _buildScreens() {
  return [
    const EventsPage(),
    const SearchPage(),
    const TicketsPage(),
    const ProfilePage(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      title: 'Eventos',
      icon: const Icon(Icons.explore),
      activeColorPrimary: Colors.white,
      inactiveColorPrimary: Colors.white.withOpacity(0.70),
    ),
    PersistentBottomNavBarItem(
      title: 'Procurar',
      icon: const Icon(Icons.search),
      activeColorPrimary: Colors.white,
      inactiveColorPrimary: Colors.white.withOpacity(0.70),
    ),
    PersistentBottomNavBarItem(
      title: 'Convites',
      icon: const Icon(Icons.qr_code_rounded),
      activeColorPrimary: Colors.white,
      inactiveColorPrimary: Colors.white.withOpacity(0.70),
    ),
    PersistentBottomNavBarItem(
      title: 'Perfil',
      icon: const Icon(Icons.account_circle),
      activeColorPrimary: Colors.white,
      inactiveColorPrimary: Colors.white.withOpacity(0.70),
    ),
  ];
}
