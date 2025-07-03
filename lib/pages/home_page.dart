import 'package:anogi_delivery/component/my_current_location.dart';
import 'package:anogi_delivery/component/my_description_box.dart';
import 'package:anogi_delivery/component/my_food_tile.dart';
import 'package:anogi_delivery/component/my_silver_app_bar.dart';
import 'package:anogi_delivery/component/my_tab_bar.dart';
import 'package:anogi_delivery/models/food.dart';
import 'package:anogi_delivery/models/restaurant.dart';
import 'package:anogi_delivery/pages/food_page.dart';
import 'package:flutter/material.dart';
import 'package:anogi_delivery/component/my_drawer.dart';
import 'package:provider/provider.dart';

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
    _tabController = TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  //sort out and return the list of food items based on the selected category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  // returns the list of food items for the selected tab
  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {

      // get category menu
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);
      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          // get individual food item
          final food = categoryMenu[index];

          //return the food tile
          return MyFoodTile(
            food: food,
             onTap: () => Navigator.push(context, MaterialPageRoute(
              builder: (context) => FoodPage(food: food),
            )),
          );
        },
      );
    }).toList();
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

        body: Consumer<Restaurant>(builder:(context, restaurant, child) => TabBarView(
          controller: _tabController,
          children: getFoodInThisCategory(restaurant.menu),
        ),
        ),
      ),
    );
  }
}