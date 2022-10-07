import 'package:flutter_modular/flutter_modular.dart';
import 'package:temparty/app/pages/ticket/ticket_controller.dart';
import 'package:flutter/material.dart';
import 'package:temparty/app/widgets/event_card_widget.dart';

class TicketPage extends StatefulWidget {
  final String title;
  const TicketPage({Key? key, this.title = 'TicketPage'}) : super(key: key);
  @override
  TicketPageState createState() => TicketPageState();
}

class TicketPageState extends State<TicketPage> {
  final TicketController store = Modular.get();

  final covers = [
    const AssetImage('assets/images/teste2.jpg'),
    null,
    null,
    null,
    null,
    null,
    null,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
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
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'MEUS CONVITES',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
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
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
