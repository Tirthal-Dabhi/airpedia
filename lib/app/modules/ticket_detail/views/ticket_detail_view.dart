import 'package:airpedia/app/modules/home/controllers/ticket_controller.dart';
import 'package:airpedia/app/modules/ticket_detail/components/ticket_detail_facilities.dart';
import 'package:airpedia/app/modules/ticket_detail/components/ticket_detail_flight.dart';
import 'package:airpedia/app/modules/ticket_detail/components/ticket_detail_header.dart';
import 'package:airpedia/app/modules/ticket_detail/components/ticket_detail_price.dart';
import 'package:airpedia/app/modules/ticket_detail/controllers/ticket_detail_controller.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/widgets/pages/page_default.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/tab/tab_ticket.dart';

class TicketDetailView extends GetView<TicketDetailController> {
   TicketDetailView({super.key});

  final ticketController = Get.put(TicketController());

  @override
  Widget build(BuildContext context) {
    return PageDefault(
      title: 'ticketDetail'.tr,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Insets.xl),
        child: Column(
          children: [
                          TicketDetailHeader(data: controller.data.value),
                          TicketDetailFlight(data: controller.data.value),
                          TicketDetailFacilities(data: controller.data.value),
                          TicketDetailPrice(data: controller.data.value),
                          ElevatedButton(
                              onPressed: () {
                                FirebaseFirestore.instance.collection("ticket_transactions").doc(ticketController.tickedTransactionIds[controller.index.value]).delete().then((value) {
                                  Navigator.pop(context);
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) => AlertDialog(
                                      title: const Text('Flight'),
                                      content: const Text('Flight Cancelle'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context, 'OK');
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                               // ref.doc(snapshot.data!.docs[index]['user_id'].toString()).delete();
                              },
                              child: Text("DELETE FLIGHT",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))
          ],
        ),
      ),
    );
  }
}
