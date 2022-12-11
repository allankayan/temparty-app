import 'package:flutter_modular/flutter_modular.dart';
import 'package:temparty/app/pages/tickets/ticket/ticket_controller.dart';
import 'package:flutter/material.dart';

class TicketPage extends StatefulWidget {
  final String title;
  const TicketPage({Key? key, this.title = 'TicketPage'}) : super(key: key);
  @override
  TicketPageState createState() => TicketPageState();
}

class TicketPageState extends State<TicketPage> {
  final TicketController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
