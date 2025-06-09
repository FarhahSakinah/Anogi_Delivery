import 'package:anogi_delivery/component/my_current_location.dart';
import 'package:anogi_delivery/component/my_description_box.dart';
import 'package:anogi_delivery/component/my_silver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:anogi_delivery/component/my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySilverAppBar(
            title: Text('Anogi Delivery'),
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

        body: Container(color: Colors.blue),
      ),
    );
  }
}