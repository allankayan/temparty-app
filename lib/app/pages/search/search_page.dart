import 'package:cached_network_image/cached_network_image.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_card/image_card.dart';
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
        padding: const EdgeInsets.only(top: 16.0),
        child: searchTextField(context),
      ),
      centerTitle: false,
      curvedBodyRadius: 8,
      headerExpandedHeight: 0.30,
      fullyStretchable: false,
      backgroundColor: Colors.white,
      appBarColor: Colors.white,
      headerWidget: headerWidget(context),
      body: [
        listEvents(context),
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
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Image(
                width: 140,
                image: AssetImage('assets/images/temparty.png'),
                fit: BoxFit.contain,
              ),
            ),
            searchTextField(context),
          ],
        ),
      ),
    );
  }

  Widget searchTextField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 60,
        child: TextField(
          controller: controller.search,
          style: const TextStyle(
            color: Colors.white,
          ),
          onChanged: (value) async {
            await controller.searchByEventName(value);
          },
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

  Widget listEvents(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Observer(
        builder: (context) {
          final events = controller.filteredEvents.toList();
          if (events.isNotEmpty) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: events.length,
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
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
