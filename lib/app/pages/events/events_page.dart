import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_loading/card_loading.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_card/image_card.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:temparty/app/pages/events/events_controller.dart';
import 'package:flutter/material.dart';
import 'package:temparty/app/widgets/gradient_button_widget.dart';
import 'package:temparty/app/widgets/story_card_widget.dart';

class EventsPage extends StatefulWidget {
  final String title;
  const EventsPage({Key? key, this.title = 'EventsPage'}) : super(key: key);

  @override
  EventsPageState createState() => EventsPageState();
}

class EventsPageState extends State<EventsPage> {
  final EventsController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
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
      body: [
        Observer(
          builder: (context) {
            final user = controller.user.value;
            if (user == null) {
              return const SizedBox(
                height: 140,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (user.isOrganizer == true) return organizerActions(context);
            return Container();
          },
        ),
        storyList(context),
        eventList(context),
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

  Widget storyList(BuildContext context) {
    return Observer(
      builder: (context) {
        final events = controller.events.value;

        if (events != null && events.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const Divider(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: GradientText(
                    'EVENTOS POPULARES',
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.w800,
                    ),
                    colors: const [
                      Colors.deepPurple,
                      Colors.indigoAccent,
                      Colors.pinkAccent,
                    ],
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: events.length,
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return StoryCardWidget(
                        image: events[index].profileImage,
                        name: events[index].name,
                        onTap: () {
                          Modular.to.pushNamed("/events/event/", arguments: events[index].eventUid);
                        },
                      );
                    },
                  ),
                ),
                const Divider(),
              ],
            ),
          );
        } else {
          return const SizedBox(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Widget eventList(BuildContext context) {
    return Observer(
      builder: (context) {
        final events = controller.events.value;

        if (events != null && events.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Você pode se interessar:',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: events.length,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: FillImageCard(
                            color: Colors.deepPurpleAccent,
                            heightImage: 140,
                            width: MediaQuery.of(context).size.width,
                            imageProvider: CachedNetworkImageProvider(
                              events[index].headerImage!,
                            ),
                            title: Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.6,
                                    child: Text(
                                      events[index].name!,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    events[index].date!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          Modular.to.pushNamed("/events/event/", arguments: events[index].eventUid);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Widget organizerActions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.deepPurpleAccent,
              blurRadius: 0,
              spreadRadius: 0,
            )
          ],
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
              child: Text(
                'PARA ORGANIZADORES DE EVENTOS:',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GradientButtonWidget(
                  text: 'Meus eventos',
                  icon: Icons.celebration_rounded,
                  left: Colors.orangeAccent,
                  right: Colors.pink,
                  onPressed: () {
                    Modular.to
                        .pushNamed("/events/my_events", arguments: controller.user.value!.userUid);
                  },
                ),
                GradientButtonWidget(
                  text: 'Criar evento',
                  icon: Icons.add_circle,
                  left: Colors.orangeAccent,
                  right: Colors.pink,
                  onPressed: () {
                    Modular.to.pushNamed('/events/create').then((value) => setState(() {}));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget loadingCards(BuildContext context, bool isStoryCard) {
    double width = 0.0;
    double height = 0.0;

    if (isStoryCard) {
      width = 80.0;
      height = 125.0;

      return SizedBox(
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CardLoading(
              height: height,
              width: width,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              margin: const EdgeInsets.only(bottom: 10, right: 10),
            );
          },
        ),
      );
    } else {
      width = MediaQuery.of(context).size.width;
      height = 100.0;

      return SizedBox(
        height: 450,
        child: ListView.builder(
          itemCount: 4,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return CardLoading(
              height: height,
              width: width,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              margin: const EdgeInsets.only(bottom: 10),
            );
          },
        ),
      );
    }
  }
}
