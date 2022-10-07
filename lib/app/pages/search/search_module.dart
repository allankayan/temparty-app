import 'package:temparty/app/pages/search/search_page.dart';
import 'package:temparty/app/pages/search/search_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SearchModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SearchController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const SearchPage()),
  ];
}
