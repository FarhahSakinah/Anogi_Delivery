import 'package:flutter/material.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});

  void openLocationSearhBox(BuildContext context) {
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: const Text("Your Location"),
        content: const TextField(
          decoration: InputDecoration(hintText: "Search for your location.."),
          ),
          actions: [
            //cancel button
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
              ),

            //save button
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Save"),
              ),
          ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Deliver now", style: TextStyle(color: Theme.of(context).colorScheme.primary),),
          GestureDetector(
            onTap: () => openLocationSearhBox(context),
            child: Row(
              children: [
                //address
                Text("Tanjong Malim UPSI",
                 style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.bold,
                  ),
                ),
                  
                //dropdown menu
                Icon(Icons.arrow_drop_down_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
