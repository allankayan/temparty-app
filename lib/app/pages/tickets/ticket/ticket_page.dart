import 'package:draggable_home/draggable_home.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:temparty/app/data/model/event_model.dart';
import 'package:temparty/app/data/model/ticket_model.dart';
import 'package:temparty/app/data/model/user_model.dart';
import 'package:temparty/app/pages/tickets/ticket/ticket_controller.dart';
import 'package:flutter/material.dart';
import 'package:temparty/app/widgets/cache_image.dart';
import 'package:temparty/app/widgets/gradient_button_widget.dart';
import 'package:transparent_image/transparent_image.dart';

class TicketPage extends StatefulWidget {
  final String uid;
  const TicketPage({Key? key, required this.uid}) : super(key: key);
  @override
  TicketPageState createState() => TicketPageState();
}

// ignore: deprecated_member_use
class TicketPageState extends ModularState<TicketPage, TicketController> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final ticket = controller.ticket.value;
        final user = controller.user.value;
        final event = controller.event.value;
        if (ticket != null && user != null && event != null) {
          return DraggableHome(
            title: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: GradientText(
                'Meu convite',
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
            leading: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: IconButton(
                style: IconButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20),
                ),
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.purpleAccent,
                ),
                onPressed: () {
                  Modular.to.pop();
                },
              ),
            ),
            centerTitle: false,
            curvedBodyRadius: 8,
            headerExpandedHeight: 0.15,
            fullyStretchable: false,
            backgroundColor: Colors.white,
            appBarColor: Colors.white,
            headerWidget: headerWidget(context),
            headerBottomBar: bottomHeaderWidget(context),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GradientButtonWidget(
                icon: Icons.download,
                text: "Baixar convite",
                left: Colors.purpleAccent,
                right: Colors.deepPurple,
                onPressed: () {},
              ),
            ),
            body: [
              ticketInfo(context, user, ticket, event),
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
      },
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
                  Icons.arrow_back,
                  color: Colors.deepPurple,
                  size: 22,
                ),
              ),
              onTap: () async {
                Modular.to.pop();
              },
            ),
          ),
        ),
      ],
    );
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
          width: 120,
          image: AssetImage('assets/images/temparty.png'),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget ticketInfo(BuildContext context, UserModel user, TicketModel ticket, EventModel event) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          InkWell(
            child: SizedBox(
              height: 180,
              child: Stack(
                children: [
                  CacheImage(
                    path: event.headerImage,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipOval(
                        child: SizedBox(
                          width: 90,
                          height: 90,
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
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              Modular.to.pushNamed("/events/event", arguments: event.eventUid);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Text(
              user.displayName!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.black87,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Text(
              "Convite ${event.name} ".toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            "${event.date} - ${event.placeCity}".toUpperCase(),
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
              fontWeight: FontWeight.w600,
              wordSpacing: 4,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: QrImage(
              data: "${ticket.ticketUid} ${ticket.eventUid} ${ticket.userUid}",
              version: QrVersions.auto,
              size: 160.0,
              foregroundColor: Colors.deepPurple,
            ),
          ),
          const Text(
            "Entrada na festa autorizada apenas com a presença do convite digital, salve no seu dispositivo ou abra o aplicativo na portaria.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
              fontWeight: FontWeight.w600,
              wordSpacing: 4,
            ),
          ),
        ],
      ),
    );
  }
}
