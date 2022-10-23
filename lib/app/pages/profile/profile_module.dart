import 'package:temparty/app/pages/profile/edit/edit_controller.dart';
import 'package:temparty/app/pages/profile/edit/edit_page.dart';
import 'package:temparty/app/pages/profile/profile_page.dart';
import 'package:temparty/app/pages/profile/profile_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ProfileController()),
    Bind.lazySingleton((i) => EditController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const ProfilePage()),
    ChildRoute('/edit', child: (_, args) => const EditPage()),
  ];
}
