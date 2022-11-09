import 'package:flutter/material.dart';

import '../models/restaurant.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key}) : super(key: key);
  static const routeName = '/detailPage';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Restaurant;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            child: Image.network(
              args.pictureId,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              args.name,
              style: const TextStyle(fontSize: 30),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: <Widget>[
                const Icon(Icons.add_location),
                Text(
                  args.city,
                  style: const TextStyle(fontSize: 15),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(args.description),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: const Text(
              "FOODS",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: args.menus['foods'].length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/food.png',
                        width: 100,
                        height: 100,
                      ),
                      Text(args.menus['foods'][index]['name'].toString())
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
