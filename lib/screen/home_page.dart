import 'package:flutter/material.dart';
import 'package:restaurant/screen/detail_page.dart';

import '../models/restaurant.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yuk Makan !!!"),
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context).loadString('assets/data.json'),
        builder: (context, snapshot) {
          final List<Restaurant> restaurants = parseRestaurant(snapshot.data);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: const Text(
                  "Find Your Meals below",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: restaurants.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          DetailPage.routeName,
                          arguments: Restaurant(
                              id: restaurants[index].id,
                              name: restaurants[index].name,
                              description: restaurants[index].description,
                              pictureId: restaurants[index].pictureId,
                              city: restaurants[index].city,
                              rating: restaurants[index].rating,
                              menus: restaurants[index].menus),
                        );
                      },
                      child: Card(
                        elevation: 0,
                        child: Row(
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(19),
                                  child: Image.network(
                                    restaurants[index].pictureId,
                                    fit: BoxFit.fill,
                                    width: 150,
                                    height: 150,
                                  ),
                                ),
                                Positioned(
                                  top: 100,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.red),
                                    width: 150,
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          '${restaurants[index].rating.toString()} ',
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  restaurants[index].name,
                                  style: const TextStyle(fontSize: 19),
                                ),
                                Text(restaurants[index].city)
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ]);
          }
        },
      ),
    );
  }
}
