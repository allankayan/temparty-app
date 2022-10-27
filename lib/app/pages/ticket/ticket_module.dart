import 'package:temparty/app/pages/ticket/ticket_page.dart';
import 'package:temparty/app/pages/ticket/ticket_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TicketModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => TicketController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const TicketPage()),
  ];
}
