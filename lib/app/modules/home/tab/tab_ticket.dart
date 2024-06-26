import 'package:airpedia/app/modules/home/components/ticket_active.dart';
import 'package:airpedia/app/modules/home/components/ticket_complete.dart';
import 'package:airpedia/app/modules/home/components/ticket_tabbar.dart';
import 'package:airpedia/app/modules/home/components/ticket_tabbar_item.dart';
import 'package:airpedia/app/modules/home/controllers/ticket_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabTicket extends GetView<TicketController> {
  const TabTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return TicketTabBar(
      onTapTabBarMenu: (index) {},
      listTabBarMenu: [
        TicketTabBarItem(label: 'active'.tr),
        TicketTabBarItem(label: 'completed'.tr),
      ],
      listTabBarView: const [
        TicketActive(),
        TicketComplete(),
      ],
    );
  }
}
