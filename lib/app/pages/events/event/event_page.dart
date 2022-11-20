import 'package:draggable_home/draggable_home.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:temparty/app/data/model/event_model.dart';
import 'package:temparty/app/pages/events/event/event_controller.dart';
import 'package:flutter/material.dart';
import 'package:temparty/app/widgets/cache_image.dart';
import 'package:temparty/app/widgets/gradient_button_widget.dart';

class EventPage extends StatefulWidget {
  final String uid;
  const EventPage({Key? key, required this.uid}) : super(key: key);
  @override
  EventPageState createState() => EventPageState();
}

class EventPageState extends State<EventPage> {
  late bool _isOwnEvent;

  final EventController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final user = controller.user.value;
        final event = controller.event.value;
        if (event != null && user != null) {
          (user.userUid == event.organizerUid) ? _isOwnEvent = true : _isOwnEvent = false;
          return DraggableHome(
            title: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: GradientText(
                event.name!,
                style: const TextStyle(
                  fontSize: 16,
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
                  color: Colors.purple,
                ),
                onPressed: () {
                  Modular.to.pop();
                },
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GradientButtonWidget(
                icon: Icons.qr_code_rounded,
                text: "Comprar ingresso",
                left: Colors.purpleAccent,
                right: Colors.deepPurpleAccent,
                onPressed: () {},
              ),
            ),
            curvedBodyRadius: 12,
            headerExpandedHeight: 0.15,
            headerBottomBar: bottomHeaderWidget(context, _isOwnEvent),
            fullyStretchable: false,
            backgroundColor: Colors.white,
            appBarColor: Colors.white,
            headerWidget: header(event),
            body: [
              eventHeader(event),
              const Divider(),
              eventInfos(event),
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

  Widget header(EventModel event) {
    return SizedBox(
      child: Stack(
        children: [
          Center(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.deepPurple,
                    Colors.deepPurpleAccent,
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                event.name!.toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget eventHeader(EventModel event) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 180,
        child: Stack(
          children: [
            (event.headerImage != null || event.headerImage == "")
                ? CacheImage(
                    path: event.headerImage,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'assets/images/eventHeader.jpg',
                    fit: BoxFit.cover,
                  ),
            // Event profile image
            // Align(
            //   alignment: Alignment.bottomLeft,
            //   child: InkWell(
            //     child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: ClipOval(
            //         child: SizedBox(
            //           width: 90,
            //           height: 90,
            //           child: Image.network(
            //             event.profileImage!,
            //             fit: BoxFit.cover,
            //             width: MediaQuery.of(context).size.width,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget eventInfos(EventModel event) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  event.name!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Text(event.date!),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Descrição: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    event.observations!,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomHeaderWidget(BuildContext context, bool isOrganizer) {
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
              onTap: () {
                Modular.to.pop();
              },
            ),
          ),
        ),
        isOrganizer
            ? ClipOval(
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
                    onTap: () {
                      Modular.to
                          .pushNamed("/event/edit/", arguments: widget.uid)
                          .then((value) => controller.refreshPage());
                    },
                  ),
                ),
              )
            : ClipOval(
                child: Material(
                  color: Colors.white, // button color
                  child: InkWell(
                    splashColor: Colors.deepPurpleAccent, // inkwell color
                    child: const SizedBox(
                      width: 40,
                      height: 40,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.deepPurple,
                        size: 22,
                      ),
                    ),
                    onTap: () {},
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
          width: 140,
          image: AssetImage('assets/images/temparty.png'),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
