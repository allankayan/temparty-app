import 'package:flutter_modular/flutter_modular.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:temparty/app/pages/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:temparty/app/widgets/event_card_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProfilePage extends StatefulWidget {
  final String title;
  const ProfilePage({Key? key, this.title = 'ProfilePage'}) : super(key: key);
  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  final ProfileController controller = Modular.get();

  final covers = [
    const AssetImage('assets/images/teste2.jpg'),
    const AssetImage('assets/images/teste3.png'),
    const AssetImage('assets/images/teste.png'),
    const AssetImage('assets/images/teste2.jpg'),
    const AssetImage('assets/images/teste3.png'),
    const AssetImage('assets/images/teste2.jpg'),
    const AssetImage('assets/images/teste3.png'),
    const AssetImage('assets/images/teste.png'),
    const AssetImage('assets/images/teste2.jpg'),
    const AssetImage('assets/images/teste3.png'),
    null,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Observer(
        builder: (context) {
          final user = controller.user.value;
          if (user != null) {
            return Container(
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
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        ElevatedButton.icon(
                                          onPressed: () async {
                                            await Modular.to
                                                .pushNamed('/profile/edit')
                                                .then((value) => controller.refreshPage());
                                          },
                                          label: const Text("Editar perfil"),
                                          icon: const Icon(
                                            Icons.edit,
                                            size: 20.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                        ElevatedButton.icon(
                                          onPressed: () {
                                            _logoutDialog(context, controller);
                                          },
                                          label: const Text("Sair"),
                                          icon: const Icon(
                                            Icons.logout,
                                            size: 20.0,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  ClipOval(
                                    child: Material(
                                      color: Colors.transparent,
                                      child: user.profileImage == null
                                          ? SizedBox(
                                              width: 128,
                                              height: 128,
                                              child: Image.asset(
                                                'assets/images/avatar.jpg',
                                                fit: BoxFit.cover,
                                              ),
                                            )
                                          : FadeInImage.memoryNetwork(
                                              placeholder: kTransparentImage,
                                              image: user.profileImage!,
                                              fit: BoxFit.cover,
                                              width: 128,
                                              height: 128,
                                            ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 5),
                                    child: Text(
                                      user.displayName!,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 22,
                                        color: Colors.deepPurple,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                  (user.bio != null)
                                      ? Padding(
                                          padding: const EdgeInsets.only(bottom: 40),
                                          child: Text(
                                            user.bio ?? "",
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        )
                                      : Container(),
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        'Eventos que estive presente:',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height,
                                    child: ListView.builder(
                                      physics: const NeverScrollableScrollPhysics(),
                                      padding: EdgeInsets.zero,
                                      itemCount: 6,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (context, index) {
                                        return EventCardWidget(
                                          image: covers[index],
                                        );
                                      },
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
            );
          } else {
            return const SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
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
              onPressed: () => controller.signOut(),
            ),
            ElevatedButton(
              child: const Text('Não'),
              onPressed: () => Modular.to.pop(),
            )
          ],
        );
      });
}
