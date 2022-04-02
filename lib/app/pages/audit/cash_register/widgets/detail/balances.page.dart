import 'package:Cinepolis/app/pages/audit/cash_register/cash_register.controller.dart';
import 'package:Cinepolis/app/widgets/app_bar/simple_app_bar/simple_app_bar.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BalancesPage extends GetView<CashRegisterController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: controller.navigationItems.length,
        child: Scaffold(
          appBar: SimpleAppBar(title: "Arqueos de Caja"),
          bottomNavigationBar:
              GetPlatform.isIOS ? tabs(context, 80, 30) : tabs(context, 50, 0),
          body: Column(
            children: [_tabsContent()],
          ),
        ));
  }

  Widget tabs(BuildContext context, double height, double padding) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.13,
        color: Theme.of(context).primaryColor,
        padding: EdgeInsets.only(bottom: 3),
        child: TabBar(
                indicatorColor: Theme.of(context).highlightColor,
                tabs: controller.navigationItems
                    .map((e) => new Tab(
                        text: e.label,
                        icon: Icon(e.icon,
                            color: Theme.of(context).highlightColor)))
                    .toList())
            .paddingOnly(bottom: padding));
  }

  Widget _tabsContent() {
    return Expanded(
      flex: 10,
      child: TabBarView(
        physics: BouncingScrollPhysics(),
        children: controller.navigationItems.map((e) => e.page).toList(),
      ),
    );
  }
}
