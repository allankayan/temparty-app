import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Observer(
        builder: (context) {
          final user = controller.user.value;
          controller.name.text = user?.displayName ?? "";
          controller.bio.text = user?.bio ?? "";
          controller.date.text = user?.birthday ?? "";
          if (user != null) {
            return Container(
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
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const BackButton(),
                                        const Text(
                                          'Editar perfil',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: () async {
                                              await controller.updateAccount();
                                              Modular.to.pop();
                                            },
                                            icon: const Icon(Icons.done))
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: ClipOval(
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
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                                          child: TextFormField(
                                            controller: controller.name,
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
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                                          child: TextFormField(
                                            controller: controller.bio,
                                            maxLines: null,
                                            keyboardType: TextInputType.multiline,
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(150),
                                            ],
                                            decoration: const InputDecoration(
                                              prefixIcon: Icon(Icons.description),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                              ),
                                              labelText: 'Bio',
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                                          child: TextFormField(
                                            controller: controller.date,
                                            keyboardType: TextInputType.datetime,
                                            decoration: const InputDecoration(
                                                prefixIcon: Icon(Icons.calendar_month),
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                ),
                                                labelText: 'data de nascimento',
                                                hintText: 'dd/mm/yyyy'),
                                          ),
                                        ),
                                        InkWell(
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                                            child: TextFormField(
                                              initialValue: user.email,
                                              enabled: false,
                                              readOnly: true,
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
                                            ),
                                          ),
                                          onTap: () => Fluttertoast.showToast(
                                            msg:
                                                'Não é possível fazer alterações no email no momento.',
                                            toastLength: Toast.LENGTH_LONG,
                                            backgroundColor: Colors.deepPurple,
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
