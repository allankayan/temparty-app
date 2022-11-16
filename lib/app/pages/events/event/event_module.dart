import 'package:temparty/app/pages/events/event/event_page.dart';
import 'package:temparty/app/pages/events/event/event_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EventModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => EventController(i.args.data["uid"])),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => EventPage(uid: args.data["uid"])),
  ];
}
