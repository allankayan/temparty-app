import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_card/image_card.dart';
import 'package:intl/intl.dart';
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
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  (user.isOrganizer == true)
                                      ? Padding(
                                          padding: const EdgeInsets.only(bottom: 10),
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
                                              border: Border.all(
                                                  color: Colors.grey,
                                                  strokeAlign: StrokeAlign.center),
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 15, top: 10, bottom: 10),
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
                                                      onPressed: () {},
                                                    ),
                                                    GradientButtonWidget(
                                                      text: 'Criar evento',
                                                      icon: Icons.add_circle,
                                                      onPressed: () async {
                                                        await Modular.to
                                                            .pushNamed('/events/create')
                                                            .then((value) => setState(() {}));
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      : Container(),
                                  const Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      'EVENTOS POPULARES',
                                      style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.deepPurple,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 150,
                                    child: FirebaseAnimatedList(
                                      query: FirebaseDatabase.instance
                                          .ref()
                                          .child('events')
                                          .orderByChild('date'),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, DataSnapshot snapshot,
                                          Animation<double> animation, int x) {
                                        var event =
                                            Map<String, dynamic>.from(snapshot.value as Map);
                                        return StoryCardWidget(
                                          image: event["profileImage"],
                                          name: event["name"],
                                        );
                                      },
                                    ),
                                  ),
                                  const Divider(),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(vertical: 10),
                                          child: Text(
                                            'Últimos eventos',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black87,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        child: FirebaseAnimatedList(
                                          shrinkWrap: true,
                                          defaultChild: const SizedBox(
                                            child: Center(
                                              child: CircularProgressIndicator(),
                                            ),
                                          ),
                                          query: FirebaseDatabase.instance.ref().child('events'),
                                          physics: const NeverScrollableScrollPhysics(),
                                          scrollDirection: Axis.vertical,
                                          itemBuilder: (context, DataSnapshot snapshot,
                                              Animation<double> animation, int x) {
                                            var event =
                                                Map<String, dynamic>.from(snapshot.value as Map);
                                            if (event.isNotEmpty) {
                                              return Padding(
                                                padding: const EdgeInsets.only(bottom: 10),
                                                child: InkWell(
                                                  child: FillImageCard(
                                                    color: Colors.deepPurpleAccent,
                                                    heightImage: 140,
                                                    width: MediaQuery.of(context).size.width,
                                                    imageProvider: CachedNetworkImageProvider(
                                                      event["headerImage"],
                                                    ),
                                                    title: Padding(
                                                      padding: const EdgeInsets.only(left: 5.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          SizedBox(
                                                            width:
                                                                MediaQuery.of(context).size.width *
                                                                    0.6,
                                                            child: Text(
                                                              event["name"],
                                                              style: const TextStyle(
                                                                color: Colors.white,
                                                                fontWeight: FontWeight.bold,
                                                                overflow: TextOverflow.ellipsis,
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            event["date"],
                                                            style: const TextStyle(
                                                              color: Colors.white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    print('teste');
                                                  },
                                                ),
                                              );
                                            } else {
                                              return const SizedBox(
                                                child: Center(
                                                  child: Text(
                                                      'Não foi possível encontrar os eventos, verifique sua conexão'),
                                                ),
                                              );
                                            }
                                          },
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
