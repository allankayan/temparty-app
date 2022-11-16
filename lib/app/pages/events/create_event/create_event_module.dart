import 'package:temparty/app/pages/events/create_event/create_event_page.dart';
import 'package:temparty/app/pages/events/create_event/create_event_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreateEventModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CreateEventController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const CreateEventPage()),
  ];
}
