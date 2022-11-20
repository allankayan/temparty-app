import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_loading/card_loading.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_card/image_card.dart';
import 'package:temparty/app/data/model/event_model.dart';
import 'package:temparty/app/pages/events/my_events/my_events_controller.dart';
import 'package:flutter/material.dart';
import 'package:temparty/app/widgets/custom_app_bar.dart';
import 'package:temparty/app/widgets/gradient_button_widget.dart';

class MyEventsPage extends StatefulWidget {
  final String title;
  const MyEventsPage({Key? key, this.title = 'MyEventsPage'}) : super(key: key);
  @override
  MyEventsPageState createState() => MyEventsPageState();
}

class MyEventsPageState extends State<MyEventsPage> {
  final MyEventsController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Meus eventos',
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Modular.to.pushNamed('/events/create');
            },
          )
        ],
      ),
      body: Observer(
        builder: (context) {
          final user = controller.user.value;
          final events = controller.events.value;
          if (user != null) {
            if (events != null && events.isNotEmpty) {
              return eventList(context, events);
            } else {
              return SizedBox(
                child: Center(
                  child: noEventsFound(),
                ),
              );
            }
          } else {
            return SizedBox(
              height: MediaQuery.of(context).size.height - 80,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }

  Widget eventList(BuildContext context, List<EventModel> events) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: events.length,
        padding: const EdgeInsets.only(top: 10),
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
    ));
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

  Widget noEventsFound() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 250,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.deepPurpleAccent,
              blurRadius: 0,
              spreadRadius: 0,
            )
          ],
          border: Border.all(color: Colors.grey, strokeAlign: StrokeAlign.center),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'EVENTOS NÃO ENCONTRADOS',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Você ainda não tem eventos no nosso aplicativo, crie um e volte mais tarde!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GradientButtonWidget(
                text: 'Criar evento',
                icon: Icons.add_circle,
                left: Colors.orangeAccent,
                right: Colors.pink,
                onPressed: () {
                  Modular.to.popAndPushNamed('/events/create').then((value) async {
                    await controller.refreshPage();
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
