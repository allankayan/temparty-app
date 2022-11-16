import 'package:draggable_home/draggable_home.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:temparty/app/pages/search/search_controller.dart';
import 'package:flutter/material.dart';

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
        searchTextField(context),
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

  Widget searchTextField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 50,
        child: TextField(
          controller: controller.search,
          style: const TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderSide: BorderSide(width: 0, style: BorderStyle.none),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            hintText: 'Pesquise o nome do evento',
            hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 14,
            ),
            labelStyle: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 14,
            ),
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            hoverColor: Colors.white,
            fillColor: Colors.deepPurpleAccent,
            filled: true,
            focusColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          ),
        ),
      ),
    );
  }
}
