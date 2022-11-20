import 'package:temparty/app/pages/events/create_event/create_event_controller.dart';
import 'package:temparty/app/pages/events/create_event/create_event_page.dart';
import 'package:temparty/app/pages/events/event/event_controller.dart';
import 'package:temparty/app/pages/events/event/event_page.dart';
import 'package:temparty/app/pages/events/events_page.dart';
import 'package:temparty/app/pages/events/events_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:temparty/app/pages/events/my_events/my_events_controller.dart';
import 'package:temparty/app/pages/events/my_events/my_events_page.dart';

class EventsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => EventsController()),
    Bind.lazySingleton((i) => CreateEventController()),
    Bind.lazySingleton((i) => EventController(i.args.data)),
    Bind.lazySingleton((i) => MyEventsController(i.args.data)),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const EventsPage()),
    ChildRoute('/create', child: (_, args) => const CreateEventPage()),
    ChildRoute('/event/:uid', child: (_, args) => EventPage(uid: args.data)),
    ChildRoute('/my_events', child: (_, args) => const MyEventsPage()),
  ];
}
