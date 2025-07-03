import 'package:anogi_delivery/component/my_current_location.dart';
import 'package:anogi_delivery/component/my_description_box.dart';
import 'package:anogi_delivery/component/my_silver_app_bar.dart';
import 'package:anogi_delivery/component/my_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:anogi_delivery/component/my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  // tab controller for the tab bar
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySilverAppBar(
            title: MyTabBar(tabController: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(indent: 25,endIndent: 25, color: Theme.of(context).colorScheme.secondary,),

                // my current location
                const MyCurrentLocation(),

                // description box
                const MyDescriptionBox(),
              ],
            )),
        ],

        body: TabBarView(
          controller: _tabController,
          children: [
            // 1st tab
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => Text("Hello")
            ),
            // 2nd tab
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => Text("Hello")
            ),
            // 3rd tab
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => Text("Hello")
            ),
          ],
      ),
    ),
  );
  }
}