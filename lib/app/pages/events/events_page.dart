import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:temparty/app/pages/events/events_controller.dart';
import 'package:flutter/material.dart';
import 'package:temparty/app/widgets/event_card_widget.dart';
import 'package:temparty/app/widgets/gradient_button_widget.dart';
import 'package:temparty/app/widgets/story_card_widget.dart';

class EventsPage extends StatefulWidget {
  final String title;
  const EventsPage({Key? key, this.title = 'EventsPage'}) : super(key: key);

  @override
  EventsPageState createState() => EventsPageState();
}

class EventsPageState extends State<EventsPage> {
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
                                                  color: Colors.deepPurple,
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
                                                            .then((value) =>
                                                                controller.refreshPage());
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
                                    height: 125,
                                    child: ListView.builder(
                                      itemCount: 6,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return const StoryCardWidget();
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
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                            'Eventos em Barra Bonita - SP',
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
