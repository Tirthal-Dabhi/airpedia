import 'package:airpedia/app/modules/admintab/addlocation.dart';
import 'package:airpedia/app/modules/admintab/addticket.dart';
import 'package:airpedia/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

import '../home/components/ticket_tabbar.dart';
import '../home/components/ticket_tabbar_item.dart';

class ticketall extends StatefulWidget {
  const ticketall({Key? key}) : super(key: key);

  @override
  State<ticketall> createState() => _ticketallState();
}

class _ticketallState extends State<ticketall> {
  @override
  Widget build(BuildContext context) {
    return TicketTabBar(
      onTapTabBarMenu: (index) {},
      listTabBarMenu: [
        TicketTabBarItem(label: 'ADD Location'.tr),
        TicketTabBarItem(label: 'ADD Ticket'.tr),
      ],
      listTabBarView: const [
        addlocation(),
        addticket(),
      ],
    );
  }
}
