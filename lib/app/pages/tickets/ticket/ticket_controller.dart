import 'dart:io';
import 'dart:ui';

import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:temparty/app/data/model/event_model.dart';
import 'package:temparty/app/data/model/ticket_model.dart';
import 'package:temparty/app/data/model/user_model.dart';
import 'package:temparty/app/data/use_cases/event/get_event_by_uid.dart';
import 'package:temparty/app/data/use_cases/ticket/get_ticket_by_uid.dart';
import 'package:temparty/app/data/use_cases/user/get_user_data.dart';
import 'package:temparty/dir/dir.dart';

part 'ticket_controller.g.dart';

class TicketController = _TicketControllerBase with _$TicketController;

abstract class _TicketControllerBase with Store {
  final Map<String, dynamic> data;
  late String uid;
  late String eventUid;

  final _getEvent = getIt.get<GetEventByUid>();
  final _getTicket = getIt.get<GetTicketByUid>();
  final getUserData = getIt.get<GetUserData>();

  _TicketControllerBase(this.uid, this.data) {
    eventUid = data["eventUid"];
  }

  @observable
  late ObservableFuture<UserModel> user = getUserData.getUserData().asObservable();

  @observable
  late ObservableFuture<TicketModel> ticket =
      _getTicket.getTicketByUid(ticketUid: uid).asObservable();

  @observable
  late ObservableFuture<EventModel> event =
      _getEvent.getEventByUid(eventUid: eventUid).asObservable();

  ScreenshotController screenshotController = ScreenshotController();

  @action
  Future<void> getTicketScreenshot() async {
    final uint8List = await screenshotController.capture();
    String tempPath = (await getTemporaryDirectory()).path;
    String fileName = "Convite Temparty - ${event.value!.name}";

    File file = await File('$tempPath/$fileName.png').create();
    file.writeAsBytesSync(uint8List!);

    final PdfDocument document = PdfDocument();
    final PdfBitmap image = PdfBitmap(file.readAsBytesSync());

    document.pages.add().graphics.drawImage(image, const Rect.fromLTWH(0, 0, 500, 1000));

    File pdf = await File('$tempPath/$fileName.pdf').create();

    pdf.writeAsBytesSync(await document.save());

    // ignore: deprecated_member_use
    await Share.shareFiles([pdf.path]);
  }
}
