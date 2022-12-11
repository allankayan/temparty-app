import 'package:card_loading/card_loading.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:temparty/app/data/model/event_model.dart';
import 'package:temparty/app/pages/tickets/tickets_controller.dart';
import 'package:flutter/material.dart';

class TicketsPage extends StatefulWidget {
  final String title;
  const TicketsPage({Key? key, this.title = 'TicketsPage'}) : super(key: key);
  @override
  TicketsPageState createState() => TicketsPageState();
}

class TicketsPageState extends State<TicketsPage> {
  final TicketsController controller = Modular.get();

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

  Widget eventList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10.0),
            child: GradientText(
              'MEUS CONVITES',
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
          Observer(
            builder: (context) {
              final tickets = controller.tickets.value;
              if (tickets != null) {
                return loadingCards(context, false);
              } else {
                return const SizedBox(
                  height: 140,
                  child: Center(
                    child: Text("nao tem convite nenhum"),
                  ),
                );
              }
            },
          ),
        ],
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
