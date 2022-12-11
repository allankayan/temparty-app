import 'package:temparty/app/pages/auth/login/login_module.dart';
import 'package:temparty/app/pages/auth/register/register_module.dart';
import 'package:temparty/app/pages/events/event/event_module.dart';
import 'package:temparty/app/pages/events/events_module.dart';
import 'package:temparty/app/pages/main/main_controller.dart';
import 'package:temparty/app/pages/main/main_module.dart';
import 'package:temparty/app/pages/profile/profile_module.dart';
import 'package:temparty/app/pages/search/search_module.dart';
import 'package:temparty/app/pages/splash/splash_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:temparty/app/pages/tickets/tickets_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => MainController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: SplashModule()),
    ModuleRoute('/main', module: MainModule()),
    ModuleRoute('/login', module: LoginModule()),
    ModuleRoute('/register', module: RegisterModule()),
    ModuleRoute('/search', module: SearchModule()),
    ModuleRoute('/ticket', module: TicketsModule()),
    ModuleRoute('/profile', module: ProfileModule()),
    ModuleRoute('/events', module: EventsModule()),
    ModuleRoute('/event', module: EventModule()),
  ];
}
