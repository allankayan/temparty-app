import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:temparty/app/pages/events/create_event/create_event_controller.dart';
import 'package:flutter/material.dart';
import 'package:temparty/app/widgets/cache_image.dart';

class CreateEventPage extends StatefulWidget {
  final String title;
  const CreateEventPage({Key? key, this.title = 'CreateEventPage'}) : super(key: key);
  @override
  CreateEventPageState createState() => CreateEventPageState();
}

class CreateEventPageState extends State<CreateEventPage> {
  final CreateEventController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Novo evento",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: Observer(
        builder: (context) {
          final user = controller.user.value;

          if (user != null) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Stack(
                          children: <Widget>[
                            SizedBox(
                              height: 180,
                              child: Stack(
                                children: [
                                  controller.headerImage != null
                                      ? ClipRRect(
                                          borderRadius: BorderRadius.circular(10.0),
                                          child: Image.file(
                                            File(controller.headerImage!.path),
                                            fit: BoxFit.cover,
                                            width: MediaQuery.of(context).size.width,
                                          ),
                                        )
                                      : const CacheImage(
                                          path:
                                              'https://servocarmecanica.com.br/wp-content/themes/primeweb/images/skins/headers/boxed/header-purpleHaze.jpg',
                                          fit: BoxFit.fill,
                                        ),
                                  Center(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.black38,
                                      ),
                                      child: IconButton(
                                        onPressed: () =>
                                            _showModalBottomSheet(context, 'headerImage'),
                                        icon: const Icon(Icons.camera_alt, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: InkWell(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Stack(
                                            children: [
                                              controller.profileImage != null
                                                  ? ClipOval(
                                                      child: SizedBox(
                                                        width: 90,
                                                        height: 90,
                                                        child: Image.file(
                                                          File(controller.profileImage!.path),
                                                          fit: BoxFit.cover,
                                                          width: MediaQuery.of(context).size.width,
                                                        ),
                                                      ),
                                                    )
                                                  : ClipOval(
                                                      child: Material(
                                                        color: Colors.transparent,
                                                        child: InkWell(
                                                          child: SizedBox(
                                                            width: 90,
                                                            height: 90,
                                                            child: Image.asset(
                                                              'assets/images/avatar.jpg',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                              Positioned(
                                                bottom: 0,
                                                right: 0,
                                                child: ClipOval(
                                                  child: Container(
                                                    padding: const EdgeInsets.all(9),
                                                    decoration: const BoxDecoration(
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey,
                                                          blurRadius: 50,
                                                          spreadRadius: 10,
                                                          offset: Offset(8, 12),
                                                        ),
                                                      ],
                                                    ),
                                                    child: const Icon(
                                                      Icons.edit,
                                                      size: 14,
                                                      color: Colors.deepPurple,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        onTap: () {
                                          _showModalBottomSheet(context, 'profileImage');
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: TextFormField(
                            controller: controller.name,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.celebration),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              labelText: 'nome do evento',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: TextFormField(
                            controller: controller.address,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.location_on),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              labelText: 'endereço',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: TextFormField(
                            controller: controller.city,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.location_on),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              labelText: 'cidade',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: TextFormField(
                            controller: controller.zipcode,
                            keyboardType: TextInputType.datetime,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.location_on),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              labelText: 'CEP',
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
                                labelText: 'dia do evento',
                                hintText: 'dd/mm/yyyy'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: TextFormField(
                            controller: controller.observations,
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(250),
                            ],
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.description),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              labelText: 'Observações',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: RoundedLoadingButton(
                            controller: controller.btnController,
                            borderRadius: 10.0,
                            color: Colors.deepPurple,
                            successColor: Colors.deepPurpleAccent,
                            resetAfterDuration: true,
                            duration: const Duration(seconds: 2),
                            animateOnTap: false,
                            onPressed: () async {
                              await controller.newEvent();
                            },
                            child: const Text(
                              'CRIAR EVENTO',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 3,
                              ),
                            ),
                          ),
                        ),
                      ],
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

  void _showModalBottomSheet(BuildContext context, String imageType) {
    showModalBottomSheet<void>(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: imageType == 'profileImage'
                          ? const Text(
                              'Escolha a foto de perfil do seu evento',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.w800,
                              ),
                            )
                          : const Text(
                              'Escolha a foto de capa do seu evento',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () async {
                        await controller
                            .imageFromCamera(imageType)
                            .then((value) => setState(() {}));
                        Modular.to.pop();
                      },
                      label: const Text("Abrir câmera"),
                      icon: const Icon(
                        Icons.camera_alt,
                        size: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () async {
                        await controller
                            .imageFromGallery(imageType)
                            .then((value) => setState(() {}));

                        Modular.to.pop();
                      },
                      label: const Text("Escolher foto existente"),
                      icon: const Icon(
                        Icons.photo,
                        size: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
