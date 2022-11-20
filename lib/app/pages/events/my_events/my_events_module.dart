import 'package:temparty/app/pages/events/my_events/my_events_page.dart';
import 'package:temparty/app/pages/events/my_events/my_events_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MyEventsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => MyEventsController(i.args.data)),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const MyEventsPage()),
  ];
}
