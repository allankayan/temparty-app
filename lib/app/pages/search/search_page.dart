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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
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
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Padding(
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
