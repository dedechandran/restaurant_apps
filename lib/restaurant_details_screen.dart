import 'package:flutter/material.dart';
import 'package:restaurant_apps/restaurant.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  static const String routeName = '/restaurant/details';

  const RestaurantDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var restaurant = ModalRoute.of(context)?.settings.arguments as Restaurant;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageHeader(restaurant: restaurant),
            Content(restaurant: restaurant)
          ],
        ),
      ),
    );
  }
}

class ImageHeader extends StatelessWidget {
  const ImageHeader({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16.0),
          bottomRight: Radius.circular(16.0),
        ),
        child: Image.network(
          restaurant.pictureId,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 18.0,
        horizontal: 16.0,
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurant.name,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.pin_drop,
                            size: 18.0,
                          ),
                          Text(restaurant.city)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 18.0,
                      ),
                      Text('${restaurant.rating}')
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Description',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          Text(
            restaurant.description,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Foods',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          _generateChipMenus(context,
              restaurant.menus.foods.map((food) => food['name']).toList()),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Drinks',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          _generateChipMenus(
            context,
            restaurant.menus.drinks.map((drink) => drink['name']).toList(),
          ),
        ],
      ),
    );
  }

  Widget _generateChipMenus(BuildContext context, List<dynamic> menus) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        itemCount: menus.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                border: Border.all(color: Colors.black)),
            child: Center(
              child: Text(menus[index]),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 8.0,
          );
        },
      ),
    );
  }
}
