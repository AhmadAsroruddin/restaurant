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
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: Image.network(
              args.pictureId,
              height: MediaQuery.of(context).size.height * 0.4,
            ),
          ),
          Container(
            child: ListTile(
              title: Text(
                args.name,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                args.city,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              trailing: Text('rating ${args.rating.toString()}'),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.12,
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Text(args.description),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: const Text(
                        "Foods",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        itemCount: args.menus['foods'].length,
                        itemBuilder: ((context, index) {
                          return Text(
                              args.menus['foods'][index]['name'].toString());
                        }),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: const Text(
                        "Beverage",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        itemCount: args.menus['drinks'].length,
                        itemBuilder: ((context, index) {
                          return Text(args.menus['drinks'][index]['name']);
                        }),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
