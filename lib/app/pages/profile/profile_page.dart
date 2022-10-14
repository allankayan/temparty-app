import 'package:flutter_modular/flutter_modular.dart';
import 'package:temparty/app/pages/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:temparty/app/widgets/event_card_widget.dart';

class ProfilePage extends StatefulWidget {
  final String title;
  const ProfilePage({Key? key, this.title = 'ProfilePage'}) : super(key: key);
  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  final ProfileController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 40, bottom: 20),
                child: Image(
                  width: 140,
                  image: AssetImage('assets/images/temparty.png'),
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                  child: SingleChildScrollView(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  RawMaterialButton(
                                    onPressed: () {
                                      _logoutDialog(context, controller);
                                    },
                                    elevation: 2.0,
                                    fillColor: Colors.deepPurple,
                                    padding: const EdgeInsets.all(12.0),
                                    shape: const CircleBorder(),
                                    child: const Icon(
                                      Icons.logout,
                                      size: 24.0,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                controller.user.displayName!,
                                style: const TextStyle(
                                  fontSize: 22,
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                controller.user.email!,
                                style: const TextStyle(
                                  fontSize: 22,
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _logoutDialog(BuildContext context, ProfileController controller) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          title: const Text('Confirmar logout'),
          titleTextStyle:
              const TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 20),
          content: const Text(
              'Deseja sair desta conta no aplicativo? Você precisará entrar novamente depois.'),
          actions: [
            TextButton(
              child: const Text('Sim'),
              onPressed: () => controller.logout(),
            ),
            ElevatedButton(
              child: const Text('Não'),
              onPressed: () => Modular.to.pop(),
            )
          ],
        );
      });
}
