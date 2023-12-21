import 'dart:convert';

import 'package:restaurant_apps/restaurant_menu.dart';

class Restaurant {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final num rating;
  final RestaurantMenu menus;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus
  });

factory Restaurant.fromJson(Map<String,dynamic> restaurant) => Restaurant(
    id: restaurant['id'], 
    name: restaurant['name'], 
    description: restaurant['description'], 
    pictureId: restaurant['pictureId'], 
    city: restaurant['city'], 
    rating: restaurant['rating'], 
    menus: RestaurantMenu.fromJson(restaurant['menus']),
  );

}

List<Restaurant> parseRestaurants(String? jsonString) {
  if (jsonString == null) {
    return [];
  }

  final List? restaurants = jsonDecode(jsonString)['restaurants'];
  return restaurants == null ? [] : restaurants.map((restaurant) => Restaurant.fromJson(restaurant)).toList();
}