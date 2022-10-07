import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:temparty/app/widgets/event_card_widget.dart';
import 'package:temparty/app/widgets/story_card_widget.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'Home'}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  late final HomeController controller;

  @override
  void initState() {
    super.initState();
    controller = Modular.get<HomeController>();
  }

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
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
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
      ),
    );
  }
}
