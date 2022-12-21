import 'package:draggable_home/draggable_home.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:temparty/app/data/model/user_model.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:temparty/app/pages/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
    return Observer(builder: (context) {
      final user = controller.user.value;
      if (user != null) {
        return DraggableHome(
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: GradientText(
              'Temparty',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.deepPurple,
                fontWeight: FontWeight.w800,
                letterSpacing: 2,
              ),
              colors: const [
                Colors.purpleAccent,
                Colors.deepPurpleAccent,
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  color: Colors.deepPurpleAccent,
                ),
              ),
            ),
          ],
          centerTitle: false,
          curvedBodyRadius: 8,
          headerExpandedHeight: 0.20,
          fullyStretchable: false,
          backgroundColor: Colors.white,
          appBarColor: Colors.white,
          headerWidget: headerWidget(context),
          headerBottomBar: bottomHeaderWidget(context),
          body: [
            profileInfo(context, user),
          ],
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
    });
  }

  Widget headerWidget(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: const Center(
        child: Image(
          width: 140,
          image: AssetImage('assets/images/temparty.png'),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget bottomHeaderWidget(BuildContext buildContext) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipOval(
          child: Material(
            color: Colors.white, // button color
            child: InkWell(
              splashColor: Colors.deepPurpleAccent, // inkwell color
              child: const SizedBox(
                width: 40,
                height: 40,
                child: Icon(
                  Icons.edit,
                  color: Colors.deepPurple,
                  size: 22,
                ),
              ),
              onTap: () async {
                await Modular.to
                    .pushNamed('/profile/edit')
                    .then((value) => controller.refreshPage());
              },
            ),
          ),
        ),
        ClipOval(
          child: Material(
            color: Colors.white, // button color
            child: InkWell(
              splashColor: Colors.deepPurpleAccent, // inkwell color
              child: const SizedBox(
                width: 40,
                height: 40,
                child: Icon(
                  Icons.exit_to_app,
                  color: Colors.deepPurple,
                  size: 22,
                ),
              ),
              onTap: () {
                _logoutDialog(context, controller);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget actions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton.icon(
          onPressed: () async {
            await Modular.to.pushNamed('/profile/edit').then((value) => controller.refreshPage());
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
    );
  }

  Widget profileInfo(BuildContext context, UserModel user) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
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
                      imageErrorBuilder: (context, error, stackTrace) {
                        return SizedBox(
                          width: 128,
                          height: 128,
                          child: Image.asset(
                            'assets/images/avatar.jpg',
                            fit: BoxFit.cover,
                          ),
                        );
                      },
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
        ],
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
