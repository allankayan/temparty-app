import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';
import 'package:temparty/app/data/model/event_model.dart';
import 'package:temparty/app/data/use_cases/event/get_event_list.dart';
import 'package:temparty/dir/dir.dart';

part 'search_controller.g.dart';

class SearchController = _SearchControllerBase with _$SearchController;

abstract class _SearchControllerBase with Store {
  final getEventList = getIt.get<GetEventList>();

  @observable
  TextEditingController search = TextEditingController();

  @observable
  late ObservableList<EventModel> filteredEvents = ObservableList<EventModel>();

  @action
  Future<void> searchByEventName(String name) async {
    final events = await getEventList.getEventList();

    filteredEvents = events
        .where((element) =>
            element.name != null && element.name!.toLowerCase().contains(name.toLowerCase()))
        .toList()
        .asObservable();
  }
}
