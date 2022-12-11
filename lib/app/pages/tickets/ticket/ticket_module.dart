import 'package:temparty/app//pages/tickets/ticket/ticket_page.dart';
import 'package:temparty/app/pages/tickets/ticket/ticket_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TicketModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => TicketController(i.args.data["uid"], i.args.data)),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => TicketPage(uid: args.data)),
  ];
}
