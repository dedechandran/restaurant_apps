class RestaurantMenu {
  final List<Map<String,dynamic>> foods;
  final List<Map<String,dynamic>> drinks;

  RestaurantMenu({required this.foods, required this.drinks});

  factory RestaurantMenu.fromJson(Map<String,dynamic> menu) => RestaurantMenu(
    drinks: List.from(menu['drinks']),
    foods: List.from(menu['foods'])
  );
}