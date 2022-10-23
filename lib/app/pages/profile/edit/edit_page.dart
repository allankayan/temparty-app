import 'package:flutter_modular/flutter_modular.dart';
import 'package:temparty/app/pages/profile/edit/edit_controller.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class EditPage extends StatefulWidget {
  final String title;
  const EditPage({Key? key, this.title = 'EditPage'}) : super(key: key);
  @override
  EditPageState createState() => EditPageState();
}

class EditPageState extends State<EditPage> {
  final EditController controller = Modular.get();
  String newName = "";
  String newEmail = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Container(
                      width: 140,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/temparty.png'),
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                    child: Center(
                      child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Row(
                                children: const [
                                  BackButton(),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      'Editar perfil',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: ClipOval(
                                      child: Material(
                                        color: Colors.transparent,
                                        child: controller.user.photoURL == null
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
                                                image: controller.user.photoURL!,
                                                fit: BoxFit.cover,
                                                width: 128,
                                                height: 128,
                                              ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                                    child: TextFormField(
                                      initialValue: controller.user.displayName,
                                      keyboardType: TextInputType.text,
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(Icons.account_circle),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        labelText: 'nome e sobrenome',
                                      ),
                                      onChanged: (text) {
                                        newName = text;
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                                    child: TextFormField(
                                      initialValue: controller.user.email,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(Icons.email_rounded),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        labelText: 'email@exemplo.com',
                                      ),
                                      onChanged: (text) {
                                        newEmail = text;
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        textStyle: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 3,
                                        ),
                                        minimumSize: const Size(double.infinity, 45),
                                      ),
                                      onPressed: () async {
                                        await controller.updateAccount(newName, newEmail);
                                        Navigator.of(context).pop();
                                      },
                                      icon: const Icon(Icons.check),
                                      label: const Text('SALVAR PERFIL '),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
