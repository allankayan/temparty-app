import 'package:temparty/app/pages/profile/edit/edit_page.dart';
import 'package:temparty/app/pages/profile/edit/edit_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EditModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => EditController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const EditPage()),
  ];
}
