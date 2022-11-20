import 'package:temparty/app/pages/events/event/edit_event/edit_event_controller.dart';
import 'package:temparty/app/pages/events/event/edit_event/edit_event_page.dart';
import 'package:temparty/app/pages/events/event/event_page.dart';
import 'package:temparty/app/pages/events/event/event_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EventModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => EventController(i.args.data)),
    Bind.lazySingleton((i) => EditEventController(i.args.data)),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => EventPage(uid: args.data)),
    ChildRoute('/edit/:uid', child: (_, args) => EditEventPage(uid: args.data)),
  ];
}
