import 'package:temparty/app/pages/home/home_controller.dart';
import 'package:temparty/app/pages/main/main_page.dart';
import 'package:temparty/app/pages/main/main_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:temparty/app/pages/search/search_controller.dart';
import 'package:temparty/app/pages/ticket/ticket_controller.dart';

class MainModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => MainController()),
    Bind.lazySingleton((i) => HomeController()),
    Bind.lazySingleton((i) => SearchController()),
    Bind.lazySingleton((i) => TicketController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const MainPage()),
  ];
}
