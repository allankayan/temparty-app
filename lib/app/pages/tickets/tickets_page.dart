import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_loading/card_loading.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_card/image_card.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:temparty/app/pages/tickets/tickets_controller.dart';
import 'package:flutter/material.dart';

class TicketsPage extends StatefulWidget {
  const TicketsPage({Key? key}) : super(key: key);
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
          'Meus convites',
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
                return eventTickets();
              } else {
                return const SizedBox(
                  child: Center(
                    child: CircularProgressIndicator(),
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

  Widget noHasTickets() {
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
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'SEUS CONVITES FICARÃO AQUI',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Você ainda não tem convites adquiridos no aplicativo, adquira um e volte mais tarde!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget eventTickets() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Observer(
            builder: (context) {
              final tickets = controller.tickets.value;

              if (tickets != null && tickets.isNotEmpty) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: tickets.length,
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
                            tickets[index].eventBanner!,
                          ),
                          title: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.6,
                                  child: Text(
                                    tickets[index].eventName!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Text(
                                  tickets[index].eventDate!,
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
                        Modular.to.pushNamed(
                          "/tickets/ticket/",
                          arguments: {
                            "uid": tickets[index].ticketUid,
                            "eventUid": tickets[index].eventUid
                          },
                        );
                      },
                    );
                  },
                );
              } else if (tickets != null && tickets.isEmpty) {
                return const SizedBox(
                  child: Center(child: Text("Você não tem convites")),
                );
              } else {
                return const SizedBox(
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
