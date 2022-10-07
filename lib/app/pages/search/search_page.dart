import 'package:flutter_modular/flutter_modular.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import 'package:temparty/app/pages/search/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:temparty/app/widgets/event_card_widget.dart';

class SearchPage extends StatefulWidget {
  final String title;
  const SearchPage({Key? key, this.title = 'SearchPage'}) : super(key: key);
  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  final SearchController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    final covers = [
      const AssetImage('assets/images/teste2.jpg'),
      const AssetImage('assets/images/teste3.png'),
      const AssetImage('assets/images/teste.png'),
      null,
      null,
      null,
    ];
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
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'PROCURAR EVENTOS',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            SearchBarAnimation(
                              isOriginalAnimation: true,
                              isSearchBoxOnRightSide: true,
                              hintText: 'Nome do evento',
                              textEditingController: controller.search,
                              buttonColour: Colors.deepPurple,
                              secondaryButtonIconColour: Colors.white,
                              buttonIconColour: Colors.white,
                              onFieldSubmitted: () {
                                setState(() {
                                  controller.search.clear();
                                });
                              },
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
