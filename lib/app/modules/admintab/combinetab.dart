import 'package:airpedia/app/modules/admintab/admindata.dart';
import 'package:airpedia/app/modules/admintab/userdata.dart';
import 'package:airpedia/app/modules/home/components/ticket_tabbar.dart';
import 'package:airpedia/app/modules/home/components/ticket_tabbar_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class combinetab extends StatefulWidget {
  const combinetab({Key? key}) : super(key: key);

  @override
  State<combinetab> createState() => _combinetabState();
}

class _combinetabState extends State<combinetab> {
  @override
  Widget build(BuildContext context) {
    return TicketTabBar(
      onTapTabBarMenu: (index) {},
      listTabBarMenu: [
        TicketTabBarItem(label: 'TicketDetails'.tr),
        TicketTabBarItem(label: 'UserDetails'.tr),
      ],
      listTabBarView: const [
        admindata(),
        userdata(),
      ],
    );
  }
}
