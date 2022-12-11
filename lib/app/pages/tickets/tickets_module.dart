import 'package:temparty/app/pages/tickets/tickets_page.dart';
import 'package:temparty/app/pages/tickets/tickets_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TicketsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => TicketsController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const TicketsPage()),
  ];
}
