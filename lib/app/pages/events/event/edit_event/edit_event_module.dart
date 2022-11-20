import 'package:temparty/app/pages/events/event/edit_event/edit_event_page.dart';
import 'package:temparty/app/pages/events/event/edit_event/edit_event_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EditEventModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => EditEventController(i.args.data["uid"])),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => EditEventPage(uid: args.data)),
  ];
}
