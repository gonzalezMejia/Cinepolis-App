import 'package:Cinepolis/app/pages/quizzer/history/detail/detail.page.dart';
import 'package:Cinepolis/app/utils/card_status.utils.dart';
import 'package:Cinepolis/app/utils/msg.utils.dart';
import 'package:Cinepolis/app/widgets/app_bar/simple_app_bar/simple_app_bar.widget.dart';
import 'package:Cinepolis/app/widgets/progress/progress.widget.dart';
import 'package:Cinepolis/data/models/entities/quizzer/quizz_history.model.dart';
import 'package:Cinepolis/data/models/enums/paginate_direction.enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'history.controller.dart';
import 'package:intl/intl.dart';

class QuizzerHistoryPage extends GetView<QuizzerHistoryController> {
  final DateFormat formatter = DateFormat('dd/MM/yyyy HH:mm');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        title: "Historial",
      ),
      body: Container(child: Obx(() {
        return controller.loading.value
            ? Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: ProgressPrimary())
            : Column(
                children: [
                  Expanded(
                    child: ListView(
                        children: controller.quizzes
                            .map((item) => _quizzItemWidget(context, item))
                            .toList()),
                  ),
                  _paginated(context).paddingOnly(top: 10)
                ],
              );
      })),
    );
  }

  Widget _quizzItemWidget(BuildContext context, QuizHistory quizz) {
    return Container(
        child: Card(
            color: Theme.of(context).indicatorColor,
            child: Column(children: [
              ListTile(
                onTap: () async {
                  if (quizz.userCampaignStatusId == 3) {
                    await controller
                        .getSummary(quizz.userCampaignId.toString());
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      builder: (context) => SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: QuizzerHistoryDetailPage(quizz),
                        ),
                      ),
                    );
                  }
                  //Pendiente
                  else if (quizz.userCampaignStatusId == 2) {
                    _resumeQuizz(context, quizz);
                  }
                  //Cancelado
                  else if (quizz.userCampaignStatusId == 4) {
                    SnackUtils.success("La encuesta se encuentra cancelada.");
                  }
                  //Expirado
                  else if (quizz.userCampaignStatusId == 5) {
                    SnackUtils.success("La encuesta se encuentra expirada.");
                  }
                },
                leading: _assignPriority(quizz.userCampaignStatusId),
                title: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(quizz.quizName)]),
                subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Folio: ${quizz.userCampaignId}",
                              style: TextStyle(fontSize: 11))
                          .paddingOnly(top: 5),
                      Text('${formatter.format(quizz.validBeginDate)} - ${formatter.format(quizz.validEndDate)}',
                              style: TextStyle(fontSize: 11))
                          .paddingOnly(top: 2),
                      Text(quizz.quizDescription,
                              style: TextStyle(fontSize: 11))
                          .paddingOnly(top: 2),
                    ]),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              Divider(
                height: 20,
                thickness: 1.2,
                color: Colors.white54,
              )
            ])));
  }

  Widget _paginated(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Spacer(),
        controller.offset.value > 0
            ? Container(
                width: 80,
                child: GestureDetector(
                    child: Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 40,
                    ),
                    onTap: () =>
                        controller.paginated(PaginateDirection.previous)))
            : Container(width: 80),
        controller.nextVisible.value
            ? Container(
                width: 80,
                child: GestureDetector(
                    child: Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                      size: 40,
                    ),
                    onTap: () => controller.paginated(PaginateDirection.next)))
            : Container(width: 80),
        Spacer()
      ],
    );
  }

  Widget _assignPriority(int statusId) {
    Widget color;

    if (statusId == 3) {
      color = StatusIndicator.approved();
    } else if (statusId == 2) {
      color = StatusIndicator.custom(Colors.yellow);
    } else if (statusId == 4) {
      color = StatusIndicator.cancel();
    } else if (statusId == 5) {
      color = StatusIndicator.custom(Color.fromRGBO(96, 125, 139, 1));
    } else {
      color = StatusIndicator.custom(Colors.purple);
    }

    return color;
  }

  void _resumeQuizz(BuildContext context, QuizHistory quizz) async {
    final result = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (builder) {
          return AlertDialog(
            title: Text(
              'Confirmación',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            content: Text('¿Quieres continuar con la encuesta?',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
            actions: <Widget>[
              TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Theme.of(context).primaryColor,
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  child: Text('Cancelar'),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  }),
              TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Theme.of(context).primaryColor,
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  child: Text('Aceptar'),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  }),
            ],
          );
        });

    if (result) controller.resumeSummary(quizz);
  }
}
