import 'package:temparty/app/pages/tickets/ticket/ticket_controller.dart';
import 'package:temparty/app/pages/tickets/ticket/ticket_page.dart';
import 'package:temparty/app/pages/tickets/tickets_page.dart';
import 'package:temparty/app/pages/tickets/tickets_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TicketsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => TicketsController()),
    Bind.lazySingleton((i) => TicketController(i.args.data["uid"], i.args.data)),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const TicketsPage()),
    ChildRoute('/ticket/:uid', child: (_, args) => TicketPage(uid: args.data["uid"]))
  ];
}
